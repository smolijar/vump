require 'root'
require 'vump/modules/version/base_file_module'
require 'sheep-a-changelog'

module Vump
  class SheepAChangelog < BaseFileVersionModule
    def filename
      'CHANGELOG.md'
    end

    def select(contents)
      doc = ::SheepAChangelog.parse(contents)
      doc.latest_version(1)
    end

    def compose(contents, version)
      doc = ::SheepAChangelog.parse(contents)
      doc.release(version, @options[:version_prefix] || 'v', @options[:date])
      doc.to_s
    end
  end
end
