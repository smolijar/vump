require 'vump/cli/reporter'
require 'vump/modules/version/sheep_a_changelog'

module Vump
  class Vump
    attr_reader :logger

    def initialize(base_path, arg, options)
      @base_path = base_path
      @arg = arg
      @options = options
      @logger = Logger.new(options)
      @reporter = Reporter.new(options)
      @reporter.report_preamble(@base_path, @arg, @options)
    end

    def all_modules
      [
        ::Vump::VersionFile,
        ::Vump::SheepAChangelog,
      ]
    end

    def load_modules
      version_modules = all_modules.map { |m| m.new(@base_path) }
      relevant_modules = version_modules.select(&:relevant?)
      @reporter.add_loaded_modules(version_modules)
      @reporter.add_relevant_modules(relevant_modules)
      relevant_modules
    end

    def read_versions(modules)
      modules.map do |mod|
        version = mod.read
        @reporter.add_read_version(mod, version)
        version
      end
    end

    def select_version(versions)
      @reporter.report_module_overview
      if versions.uniq.length > 1
        @logger.warn("Inconsitent version records: #{versions}")
        return false
      end
      @logger.info(
        "Single version extracted from all modules: #{versions.first}"
      )
      versions.first
    end

    def write_versions(modules, version)
      modules.map do |mod|
        mod.write(version)
        @logger.debug("Writing new version \"#{version}\"", mod.class)
      end
      @logger.info("All relevant modules written \"#{version}\"")
    end

    def start
      modules = load_modules
      version = select_version(read_versions(modules))
      semver = Semver.new(version)
      semver.bump(@arg)
      write_versions(modules, semver.to_s)
    end
  end
end
