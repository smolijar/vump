require 'json'
require 'date'
require 'keepachangelog'
require_relative '../read_write_version_module'

module Vump
  module VersionModule
    # [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
    class KeepAChangeLog < ReadWriteVersionModule
      def self.name
        'CHANGELOG.md'
      end

      def path
        @base + '/CHANGELOG.md'
      end

      def scrape(str)
        Keepachangelog::MarkdownParser.parse(str)['versions'].keys.select{|v| v != 'Unreleased'}.first
      end

      def compose(new_version)
        content = Keepachangelog::MarkdownParser.parse(@read_contents)
        # inherit all from unreleased
        content['versions'][new_version] = content['versions']['Unreleased'].clone
        # update date
        content['versions'][new_version]['date'] = Date.today.to_s
        # reset unreleased
        content['versions']['Unreleased']['changes'] = {}
        parser = Keepachangelog::Parser.new
        parser.parsed_content = content
        parser.to_md + "\n"
      end
    end
  end
end
