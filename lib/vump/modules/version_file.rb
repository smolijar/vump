require 'vump/modules/base_file_module'

module Vump
  class VersionFile < BaseFileModule
    def filename
      'VERSION'
    end

    def select(contents)
      contents.strip
    end

    def compose(_contents, version)
      "#{version}\n"
    end
  end
end
