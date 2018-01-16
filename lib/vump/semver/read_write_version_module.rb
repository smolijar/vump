module Vump
  # Read write version module archetype
  class ReadWriteVersionModule
    def self.read
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

    def self.scrape(_str)
      raise NotImplementedError
    end

    def self.compose(_new_version)
      raise NotImplementedError
    end

    def self.path
      raise NotImplementedError
    end

    def self.write(new_version)
      File.write(path, compose(new_version))
      Vump.logger.debug("#{name} bumped to `#{new_version}` in `#{path}`")
    end
  end
end
