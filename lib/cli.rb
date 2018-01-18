require File.expand_path('vump/version', __dir__)
require File.expand_path('vump/meta', __dir__)
require File.expand_path('vump', __dir__)
require 'optparse'

# Root module for package Vump
module Vump
  # CLI module for package Vump
  module CLI
    # Parse CLI arguemnts
    #
    # @param [Array[String]] _ arguments (not used now)
    #   OptionParser parses ARGV
    # @return [Array[String], Array[String]] options and args
    def self.parse_argv(_)
      options = {}
      args = OptionParser.new do |opt|
        opt.on('-h', '--help') { options[:help] = true }
        opt.on('--version') { options[:version] = true }
        opt.on('-v', '--verbose') { options[:verbose] = true }
        opt.on('-s', '--silent') { options[:silent] = true }
      end.parse!
      setup(options)
      [options, args]
    end

    # Tets if CLI arguments are valid.
    #
    # @param [Array[String]] args CLI args
    # @return true if all valid
    def self.valid_args(args)
      if args.length != 1
        Vump.logger.error "Wrong number of args. Got #{args.length}, expected 1"
        false
      elsif !/^(ma|mi|p)/i.match(args.first)
        Vump.logger.error 'Unknown version to bump. <major|minor|patch>'
        false
      else
        true
      end
    end

    def self.setup(options)
      Vump.logger.level = Logger::INFO
      if options[:verbose]
        Vump.logger.level = Logger::DEBUG
      elsif options[:silent]
        Vump.logger.level = Logger::UNKNOWN
      end
    end

    # Main CLI command
    def self.start(argv)
      options, args = parse_argv(argv)
      if options[:version]
        Vump.logger.info "vump #{Vump::VERSION}"
      elsif options[:help]
        Vump.logger.info Vump::SUMMARY
      elsif valid_args(args)
        Vump.orchestrate(args)
      else
        Vump.logger.info 'vump <major|minor|patch>'
      end
    end
  end
end
