require File.expand_path('vump/semver/semver', __dir__)
Dir[File.expand_path('vump/semver/module/*.rb', __dir__)]
  .each { |file| require file }
require 'logger'

module Vump
  @@logger = Logger.new(STDOUT)
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

  def self.modules
    modules_versions = Vump::VersionModule
                       .constants
                       .map { |m| Vump::VersionModule.const_get(m) }
                       .select { |m| m.is_a? Module }
                       .map { |m| [m, m.read] }
                       .select { |_m, v| v }
    current_versions = modules_versions.map { |_m, v| v }
    v_modules = modules_versions.map { |m, _v| m }
    [v_modules, current_versions]
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
  module VersionModule
  end
end
