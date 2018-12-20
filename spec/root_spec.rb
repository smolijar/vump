require 'root'

root = Vump

RSpec.describe root.name, type: :request do
  it 'root exists' do
    expect(root).to be_truthy
  end
end
