require_relative 'vump/semver/semver'
Dir[File.expand_path('vump/semver/version_modules/file_modules/*.rb', __dir__)]
  .each { |file| require file }
Dir[File.expand_path('vump/semver/version_modules/vcs_modules/*.rb', __dir__)]
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
    mods_vers = Vump::VersionModules::FileModules
                .constants
                .map { |m| Vump::VersionModules::FileModules.const_get(m) }
                .select { |m| m.is_a? Class }
                .map { |m| m.new(base) }
                .map { |m| [m, m.read] }
                .select { |_m, v| v }
    # "unzip"
    mods_vers.empty? ? [[], []] : mods_vers.transpose
  end

  # Format CLI output
  #
<<<<<<< 32f558b2de4e27a4d23300d44487d1993bf39355
  # @param [Array<String>] args CLI args
  # @return [String] output
=======
  # @param [Array[String]] args CLI args
  # @return [int] error output (0 no errors)
>>>>>>> Fix CLI return value
  def self.orchestrate(args)
    v_modules, current_versions = modules
    if current_versions.uniq.length > 1
      Vump.logger.error 'Different versions detected. Quitting.'
      return 1
    else
      new_version = bump(args.first, Vump::Semver.new(current_versions.first))
      v_modules.each { |m| m.write(new_version.to_s) }
      Vump::VersionModules::VcsModules::Git.revise(v_modules, new_version)
      return 0
    end
  end

  # Module containing all worker modules to be executed on bump
  module VersionModules
    # All file read/write modules to be exectued
    module FileModules
    end
    # All VCS modules to be exectued
    module VcsModules
    end
  end
end
