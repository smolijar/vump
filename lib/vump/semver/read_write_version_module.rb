module Vump
  # Read write version module archetype
  class ReadWriteVersionModule
    def read
      path = self.class.path
      name = self.class.name
      if File.file?(path)
        ver = scrape(File.read(path))
        Vump.logger.debug("#{name} read `#{ver}` from `#{path}`")
      else
        Vump.logger.debug("#{name} could not find `#{path}`")
      end
      ver
    end

    def self.name
      raise NotImplementedError
    end

    def self.path
      raise NotImplementedError
    end

    def scrape(_str)
      raise NotImplementedError
    end

    def compose(_new_version)
      raise NotImplementedError
    end

    def write(new_version)
      name = self.class.name
      path = self.class.path
      File.write(path, compose(new_version))
      Vump.logger.debug("#{name} bumped to `#{new_version}` in `#{path}`")
    end
  end
end
