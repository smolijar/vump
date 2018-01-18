module Vump
  module VersionModules
    # Read write version module archetype
    class ReadWriteVersionModule
      def initialize(base)
        @base = base
      end

      def read
        name = self.class.name
        if File.file?(path)
          @read_contents = File.read(path)
          ver = scrape(@read_contents)
          Vump.logger.debug("#{name} read `#{ver}` from `#{path}`")
        else
          Vump.logger.debug("#{name} could not find `#{path}`")
        end
        ver
      end

      def write(new_version)
        name = self.class.name
        File.write(path, compose(new_version))
        Vump.logger.debug("#{name} bumped to `#{new_version}` in `#{path}`")
        Vump.logger.info("#{name} successfully bumped!")
      end

      def self.name
        raise NotImplementedError
      end

      def path
        raise NotImplementedError
      end

      def scrape(_str)
        raise NotImplementedError
      end

      def compose(_new_version)
        raise NotImplementedError
      end
    end
  end
end
