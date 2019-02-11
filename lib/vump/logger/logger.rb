require 'root'
require 'logger'

module Vump
  class Logger
    attr_reader :logger

    def initialize(_options)
      @logger = ::Logger.new(STDOUT)
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
  end
end
