require 'vump/modules/package_json'

module Vump
  class ComponentJson < PackageJson
    def filename
      'component.json'
    end
  end
end
