require 'spec_helper'

describe Puppet::Type.type(:maillist), type: :type do
  let(:maillist) do
    described_class.new(
      name: 'dummy',
      provider: :mailman,
    )
  end

  let(:provider) { maillist.provider }
  let(:catalog) { Puppet::Resource::Catalog.new }

  # Mail List aliases are careful not to stomp on managed Mail Alias aliases
  it 'generates aliases unless they already exist' do
    allow(maillist).to receive(:catalog) { catalog }

    # test1 is an unmanaged alias from /etc/aliases
    allow(Puppet::Type.type(:mailalias).provider(:aliases)).to receive(:target_object) { StringIO.new("test1: root\n") }

    # test2 is a managed alias from the manifest
    dupe = Puppet::Type.type(:mailalias).new(name: 'test2')
    catalog.add_resource dupe

    allow(provider).to receive(:aliases).and_return('test1' => 'this will get included', 'test2' => 'this will dropped', 'test3' => 'this will get included')
    generated = maillist.generate
    expect(generated.map { |x| x.name  }.sort).to eq(['test1', 'test3'])
    expect(generated.map { |x| x.class }).to      eq([Puppet::Type::Mailalias, Puppet::Type::Mailalias])
  end
end
