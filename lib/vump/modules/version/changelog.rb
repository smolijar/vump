require 'root'
require 'vump/modules/version/base_file_module'
require 'sheep-a-changelog'

module Vump
  class Changelog < BaseFileVersionModule
    def filename
      'CHANGELOG.md'
    end

    def select(contents)
      doc = SheepAChangelog.parse(contents)
      # doc.latest_version_title
      doc.latest_version(1)
    end

    def compose(contents, version)
      doc = SheepAChangelog.parse(contents)
      # p version
      # p doc
      # doc.remove_anchor_unreleased
      # p doc.version_root
      # doc.rename_version('[Unreleased]', "[#{version}] - #{Time.now.strftime('%Y-%m-%d')}")
      doc.release(version, 'v')
      doc.to_s
    end
  end
end
