require_relative '../read_write_version_module'

module Vump
  module VersionModule
    # Module for VERSION file
    class VersionFile < ReadWriteVersionModule
      def self.name
        'VERSION'
      end

      def self.scrape(str)
        str.strip
      end

      def self.compose(new_version)
        new_version + "\n"
      end

      def self.path
        Dir.pwd + '/VERSION'
      end
    end
  end
end
