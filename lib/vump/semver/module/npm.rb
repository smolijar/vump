require 'json'
module Vump
  module VersionModule
    module Npm
      def self.read
        path = self.path
        if File.file?(path)
          ver = JSON.parse(File.read(path))['version']
          Vump.logger.debug("NPM read `#{ver}` from `#{path}`")
        else
          Vump.logger.debug("NPM could not find `#{path}`")
        end
        ver
      end

      def self.path
        Dir.pwd + '/package.json'
      end

      def self.write(new_version)
        json = JSON.parse(File.read(path))
        json['version'] = new_version
        File.write(path, JSON.pretty_generate(json) + "\n")
        Vump.logger.debug("NPM bumped to `#{new_version}` in `#{path}`")
      end
    end
  end
end
