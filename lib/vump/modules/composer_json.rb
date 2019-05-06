require 'vump/modules/package_json'

module Vump
  class ComposerJson < PackageJson
    def filename
      'composer.json'
    end
  end
end
