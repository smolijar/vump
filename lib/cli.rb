require 'root'

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
    [parse_args(args), parse_options(options)]
  end

  def self.parse_args(args)
    case args.first
    when /^ma.*/
      :major
    when /^mi.*/
      :minor
    else
      :patch
    end
  end

  def self.parse_options(options)
    options
  end

  def self.start(inputs)
    arg, opts = parse_inputs(inputs)
    vump = Vump::Vump.new(Dir.pwd, arg, opts)
    vump.start
  end
end
