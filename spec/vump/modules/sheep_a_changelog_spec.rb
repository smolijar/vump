require 'vump/modules/sheep_a_changelog'

mod = Vump::SheepAChangelog.new('', date: Time.new(2019, 02, 20))
changelog = File.read(File.expand_path("examples/#{mod.filename}", __dir__))

RSpec.describe Vump::SheepAChangelog do
  it 'filename' do
    expect(mod.filename).to eql('CHANGELOG.md')
  end

  it 'select' do
    expect(mod.select(changelog)).to eql('0.1.0')
  end

  it 'compose' do
    expect(mod.compose(changelog, '1.1.2')).to match_snapshot
  end
end
