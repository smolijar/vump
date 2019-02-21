require 'vump/modules/version/base_module'

path = '/foo'
version_module = Vump::BaseVersionModule.new(path)

RSpec.describe Vump::BaseVersionModule do
  it 'initialize' do
    expect(version_module.instance_variable_get('@base_path')).to be(path)
  end

  it 'relevant?' do
    expect(version_module.relevant?).to be(false)
  end

  it 'name' do
    expect(version_module.name).to eql(Vump::BaseVersionModule.name)
  end

  it 'read' do
    expect { version_module.read }.to raise_error(NotImplementedError)
  end

  it 'write' do
    expect { version_module.write('bar') }.to raise_error(NotImplementedError)
  end

  it 'to_stage' do
    expect { version_module.to_stage }.to raise_error(NotImplementedError)
  end
end
