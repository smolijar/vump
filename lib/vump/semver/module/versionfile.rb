module Vump
  module VersionModule
    module VersionFile
      def self.read
        path = self.path
        if File.file?(path)
          ver = File.read(path).strip
          Vump.logger.debug("VersionFile read `#{ver}` from `#{path}`")
        else
          Vump.logger.debug("VersionFile could not find `#{path}`")
        end
        ver
      end

      def self.path
        Dir.pwd + '/VERSION'
      end

      def self.write(new_version)
        path = self.path
        File.write(path, "#{new_version}\n")
        Vump.logger.debug("VersionFile bumped to `#{new_version}` in `#{path}`")
      end
    end
  end
end
