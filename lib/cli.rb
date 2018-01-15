require File.expand_path('vump/version', __dir__)
require File.expand_path('vump/meta', __dir__)
require File.expand_path('vump', __dir__)
require 'optparse'
require 'logger'

# Root module for package Vump
module Vump
  @@logger = Logger.new(STDOUT)
  def self.logger
    @@logger
  end

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
        opt.on('-v', '--version') { options[:version] = true }
      end.parse!
      [options, args]
    end

    # Tets if CLI arguments are valid.
    #
    # @param [Array[String]] args CLI args
    # @return true if all valid
    def self.valid_args(_args)
      true
    end

    # Format CLI output
    #
    # @param [Array[String]] args CLI args
    # @return [String] output
    def self.bump(_args)
      v_modules = Vump::VersionModule
                  .constants
                  .map { |m| Vump::VersionModule.const_get(m) }
                  .select { |m| (m.is_a? Module) && m.read }
      versions = v_modules.map(&:read).uniq
      # if versions.length = 0, nothing to do
      # if versions.length > 1, inconsistent
      new_version = 'updated version'
      v_modules.each { |m| m.write(new_version) }
    end

    # Main CLI command
    def self.start(argv)
      options, args = parse_argv(argv)
      if options[:version]
        puts "vump #{Vump::VERSION}"
      elsif valid_args(args)
        bump(args)
      else
        puts 'Error: invalid version part to bump.' unless args.empty?
        puts Vump::SUMMARY if options[:help]
        puts 'vump <major|minor|patch>'
      end
    end
  end
end
