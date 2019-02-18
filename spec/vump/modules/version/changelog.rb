require 'vump/modules/version/sheep_a_changelog'

mod = Vump::SheepAChangelog.new('')

RSpec.describe SheepAChangelog do
  it 'filename' do
    expect(mod.filename).to eql('CHANGELOG.md')
  end
end
