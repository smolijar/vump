require 'vump'

def parse_inputs(inputs) # rubocop:disable Metrics/MethodLength
  options = {}
  args = []
  inputs.each do |input|
    case input
    when /--?(.*)/
      options[Regexp.last_match(1).to_sym] = true
    when /--(?<key>.*?)=(?<value>.*)/
      options[Regexp.last_match(1).to_sym] = Regexp.last_match(2)
    else
      args << input
    end
  end
  [args, options]
end

# Command line interface for Vump
module Vump::CLI
  def self.start(inputs)
    args, opts = parse_inputs inputs
    p opts
    p args
  end
end
