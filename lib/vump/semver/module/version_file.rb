require_relative '../read_write_version_module'

module Vump
  module VersionModule
    # Module for VERSION file
    class VersionFile < ReadWriteVersionModule
      def self.name
        'VERSION'
      end

      def self.path
        Dir.pwd + '/VERSION'
      end

      def scrape(str)
        str.strip
      end

      def compose(new_version)
        new_version + "\n"
      end
    end
  end
end
