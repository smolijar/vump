module Vump
end

require 'vump_logger'
require 'modules/version_file'

class Vump::Vump
  def initialize(base_path, arg, options)
    @base_path = base_path
    @arg = arg
    @options = options
    @logger = Vump::Logger.new(options)
    report_start
  end

  def report_start
    @logger.debug("Base path: #{@base_path}")
    @logger.debug("Arguments: #{@arg}")
    @logger.debug("Options: #{@options}")
  end

  def load_modules
    version_modules = [
      Vump::VersionFile
    ]
    relevant_modules = version_modules.keep_if { |x| x.relevant?(@base_path) }
    @logger.debug("Loaded modules: #{version_modules.map(&:name)}")
    @logger.debug("Relevant modules: #{relevant_modules.map(&:name)}")
    relevant_modules
  end

  def read_versions(modules)
    modules.map do |mod|
      version = mod.read(@base_path)
      @logger.info("Read current version of \"#{version}\"", mod.name)
      version
    end
  end

  def select_version(versions)
    if versions.uniq.length <= 1
      @logger.warn("Inconsitent version records: #{versions}")
      return false
    end
    version.first
  end

  def start
    modules = load_modules
    version = select_version(read_versions(modules))

    new_version = '2.0.5'
    Vump::VersionFile.write(@base_path, new_version)
  end
end
