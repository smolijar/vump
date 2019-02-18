require 'vump/modules/version/sheep_a_changelog'

mod = Vump::SheepAChangelog.new('')

RSpec.describe SheepAChangelog do
  it 'filename' do
    expect(mod.filename).to eql('CHANGELOG.md')
  end

  it 'select' do
    changelog = File.read(File.expand_path("examples/#{mod.filename}", __dir__))
    expect(mod.select(changelog)).to eql('0.1.0')
  end

  it 'compose' do
    changelog = File.read(File.expand_path("examples/#{mod.filename}", __dir__))
    expect(mod.compose(changelog, '1.1.2')).to match_snapshot
  end
end
