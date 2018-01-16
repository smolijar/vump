require 'json'
require_relative '../read_write_version_module'

module Vump
  module VersionModule
    # Npm version module for package.json
    class Npm < ReadWriteVersionModule
      def self.name
        'Npm'
      end

      def self.scrape(str)
        JSON.parse(str)['version']
      end

      def self.compose(new_version)
        json = JSON.parse(File.read(path))
        json['version'] = new_version
        JSON.pretty_generate(json) + "\n"
      end

      def self.path
        Dir.pwd + '/package.json'
      end
    end
  end
end
