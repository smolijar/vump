require 'json'
require_relative 'npm'

module Vump
  module VersionModules
    module FileModules
      # Npm version module for package.json
      class NpmLock < Npm
        def path
          @base + '/package-lock.json'
        end
      end
    end
  end
end
