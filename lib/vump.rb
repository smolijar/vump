require File.expand_path('vump/semver/semver', __dir__)
Dir[File.expand_path('vump/semver/module/*.rb', __dir__)]
  .each { |file| require file }
require 'logger'

# Root package module
module Vump
  @@logger = Logger.new(STDOUT)
  @@logger.formatter = proc do |severity, _datetime, _progname, msg|
    "#{severity}: #{msg}\n"
  end

  def self.logger
    @@logger
  end

  def self.bump(what, version)
    case what
    when /^ma/i
      version.bump_major
    when /^mi/i
      version.bump_minor
    when /^p/i
      version.bump_patch
    end
    version
  end

  def self.modules(base = Dir.pwd)
    modules_versions = Vump::VersionModule
                       .constants
                       .map { |m| Vump::VersionModule.const_get(m) }
                       .select { |m| m.is_a? Class }
                       .map { |m| m.new(base) }
                       .map { |m| [m, m.read] }
                       .select { |_m, v| v }
    # "unzip"
    modules_versions.transpose
  end

  # Format CLI output
  #
  # @param [Array[String]] args CLI args
  # @return [String] output
  def self.orchestrate(args)
    v_modules, current_versions = modules
    if current_versions.uniq.length > 1
      Vump.logger.error 'Different versions detected. Quitting.'
    else
      new_version = bump(args.first, Vump::Semver.new(current_versions.first))
      v_modules.each { |m| m.write(new_version.to_s) }
    end
  end

  # Module containing all worker modules to be executed on bump
  module VersionModule
  end
end
