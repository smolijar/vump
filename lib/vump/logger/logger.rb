require 'logger'
require 'forwardable'

module Vump
  class Logger
    extend Forwardable
    def_delegators :@logger, :level=

    def initialize(options = {})
      @logger = ::Logger.new(options[:out] || STDOUT)
      @logger.level = ::Logger::DEBUG if options[:verbose]
      @logger.level = ::Logger::UNKNOWN if options[:silent]
      @logger.formatter = proc do |_severity, _datetime, progname, msg|
        progname ? "[#{progname}] #{msg}\n" : "#{msg}\n"
      end
    end

    def info(message, module_name = nil)
      @logger.add(::Logger::INFO, message, module_name)
    end

    def debug(message, module_name = nil)
      @logger.add(::Logger::DEBUG, message, module_name)
    end

    def warn(message, module_name = nil)
      @logger.add(::Logger::WARN, message, module_name)
    end

    def error(message, module_name = nil)
      @logger.add(::Logger::ERROR, message, module_name)
    end
  end
end
