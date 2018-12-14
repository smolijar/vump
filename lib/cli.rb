require 'vump'

# Command line interface for Vump
module Vump::CLI
  def self.parse_inputs(inputs) # rubocop:disable Metrics/MethodLength
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

  def self.parse_args(args)
    args
  end

  def self.parse_options(options)
    options
  end

  def self.start(inputs)
    args, opts = parse_inputs(inputs)
    vump = Vump::Vump.new(Dir.pwd, args, opts)
    vump.start
  end
end
