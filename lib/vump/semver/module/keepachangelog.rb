require 'json'
require 'date'
require 'keepachangelog'
require_relative '../read_write_version_module'
require_relative '../monkey/keepachangelog'

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
        Keepachangelog::MarkdownParser
          .parse(str)['versions']
          .keys
          .reject { |v| v == 'Unreleased' }
          .first
      end

      def compose(new_version)
        content = Keepachangelog::MarkdownParser.parse(@read_contents)
        content = release_changelog(content, new_version)
        parser = Keepachangelog::Parser.new
        parser.parsed_content = content
        parser.to_md + "\n"
      end

      def release_changelog(changelog, new_version)
        versions = changelog['versions']
        # inherit all from unreleased
        versions[new_version] = versions['Unreleased']
                                .clone
        # update date
        versions[new_version]['date'] = Date.today.to_s
        # reset unreleased
        versions['Unreleased']['changes'] = {}
        changelog
      end
    end
  end
end
