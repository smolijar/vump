require 'vump/modules/package_json'

module Vump
  class BowerJson < PackageJson
    def filename
      'bower.json'
    end
  end
end
