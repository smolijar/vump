require 'vump/modules/version_file'

mod = Vump::VersionFile.new('')

RSpec.describe Vump::VersionFile do
  it 'filename' do
    expect(mod.filename).to eql('VERSION')
  end

  it 'select' do
    expect(mod.select("1.1.1\n")).to eql('1.1.1')
  end

  it 'compose' do
    expect(mod.compose("1.1.1\n", '1.1.2')).to eql("1.1.2\n")
  end
end
