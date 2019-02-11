require 'vump/meta'

RSpec.describe 'Vump meta data' do
  it 'works and is unchanged' do
    meta = %i[version author name description email license homepage summary]
           .map { |m| [m, Vump::Meta.public_send(m)] }.to_h
    expect(meta).to match_snapshot
  end
end
