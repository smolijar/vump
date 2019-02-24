require 'vump/modules/package_json'

module Vump
  class PackageLockJson < PackageJson
    def filename
      'package-lock.json'
    end
  end
end
