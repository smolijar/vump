require 'vump/modules/version/version_file'

module Vump
  module Meta
    def self.name
      'vump'.freeze
    end

    def self.version
      VersionFile.new(File.expand_path('../..', __dir__)).read
    end

    def self.summary
      'Raise version version in root of semver project.'.freeze
    end

    def self.description
      text = <<-DESCRIPTION
        Semantic version bumper. CLI tool to easily manage projects using semver and automate menial version raising.
      DESCRIPTION
      text.strip
    end

    def self.homepage
      'https://github.com/grissius/vump'.freeze
    end

    def self.license
      'MIT'.freeze
    end

    def self.author
      'Jaroslav Šmolík'.freeze
    end

    def self.email
      'grissius@gmail.com'.freeze
    end
  end
end
