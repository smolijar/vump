require 'vump/modules/base_file_module'

module Vump
  class PackageJson < BaseFileModule
    def filename
      'package.json'
    end

    def name
      filename
    end

    def select(contents)
      @parsed = JSON.parse(contents)
      @parsed['version']
    end

    def compose(contents, version)
      json = @parsed.clone
      json['version'] = version
      JSON.pretty_generate(json) + "\n"
    end
  end
end
