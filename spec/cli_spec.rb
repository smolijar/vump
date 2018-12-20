require 'root'

cli = Vump::CLI

RSpec.describe cli.name, type: :request do
  context 'parse_args' do
    it 'parses' do
      args, options = cli.parse_args(%w[-v arg1 --long=value arg2])
      expect([args, options]).to match_snapshot
    end
    it 'parses none' do
      args, options = cli.parse_args([''])
      expect([args, options]).to match_snapshot
    end
    it 'parses repeated' do
      input_args = %w[-v --foo=bar a -v --foo=baz a]
      args, options = cli.parse_args(input_args)
      expect([args, options]).to match_snapshot
    end
  end
  context 'parse_arg' do
    it 'major with more args' do
      expect(cli.parse_arg(%w[major foo])).to eql(:major)
    end
    it 'minor with typo' do
      expect(cli.parse_arg(%w[minro])).to eql(:minor)
    end
    it 'patch on invalid' do
      expect(cli.parse_arg(%w[brekeke])).to eql(:patch)
    end
    it 'patch on default' do
      expect(cli.parse_arg([])).to eql(:patch)
    end
  end
  context 'parse_inputs' do
    it 'parses' do
      arg, opts = cli.parse_inputs(%w[-s min --build=alpha])
      expect([arg, opts]).to match_snapshot
    end
  end
end
