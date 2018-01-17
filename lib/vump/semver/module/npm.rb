require 'json'
require_relative '../read_write_version_module'

module Vump
  module VersionModule
    # Npm version module for package.json
    class Npm < ReadWriteVersionModule
      def self.name
        'package.json'
      end

      def path
        @base + '/package.json'
      end

      def scrape(str)
        JSON.parse(str)['version']
      end

      def compose(new_version)
        json = JSON.parse(@read_contents)
        json['version'] = new_version
        JSON.pretty_generate(json) + "\n"
      end
    end
  end
end
