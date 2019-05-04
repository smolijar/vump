require 'vump/modules/package_json'

module Vump
  class BowerJson < PackageJson
    def filename
      'component.json'
    end
  end
end
