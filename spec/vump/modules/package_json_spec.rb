require 'vump/modules/package_json'

mod = Vump::PackageJson.new('')
json = File.read(File.expand_path("examples/#{mod.filename}", __dir__))

RSpec.describe Vump::PackageJson do
  it 'filename' do
    expect(mod.filename).to eql('package.json')
  end

  it 'select' do
    expect(mod.select(json)).to eql('0.4.2')
  end

  it 'compose' do
    expect(mod.compose(json, '0.4.3')).to match_snapshot
  end
end
