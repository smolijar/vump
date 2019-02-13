require 'command_line_reporter'
require 'logger'

module Vump
  class Reporter
    include CommandLineReporter

    def initialize(options)
      @modules = {}
      @level = ::Logger::INFO
      @level = ::Logger::UNKNOWN if options[:silent]
    end

    def add_loaded_modules(mods)
      mods.map(&:name).each { |m| @modules[m] = { loaded: true } }
    end

    def add_relevant_modules(mods)
      mods.map(&:name).each { |m| @modules[m][:relevant] = true }
    end

    def add_read_version(mod, version)
      @modules[mod.name][:read_version] = version
    end

    def report_preamble(base_path, arg, options)
      return if @level > ::Logger::INFO

      header title: 'Vump', width: 80, align: 'center', rule: true, color: 'yellow', bold: true, timestamp: true
      table(border: false) do
        row do
          column('Base path', width: 10)
          column(base_path, width: 30)
        end
        row do
          column('Argument', width: 10)
          column(arg, width: 30)
        end
        row do
          column('Options', width: 10)
          column(options, width: 30)
        end
      end
    end

    def report_module_overview
      return if @level > ::Logger::INFO

      header title: 'Version module overview', align: 'center', width: 80
      table(border: true) do
        row do
          column('NAME', width: 20)
          column('STATUS', width: 30)
          column('READ VERSION', width: 20)
        end
        @modules.each do |name, data|
          row do
            rel = data[:relevant]
            column(name)
            column(rel ? 'relevant' : 'loaded', color: rel ? 'green' : nil)
            column(data[:read_version], color: rel ? 'green' : nil)
          end
        end
      end
    end
  end
end
