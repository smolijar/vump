RSpec.describe 'gemspec' do
  it 'gem built' do
    expect(system('gem build vump.gemspec > /dev/null')).to be_truthy
  end
end
