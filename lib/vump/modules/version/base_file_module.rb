require 'vump/modules/version/base_module'

module Vump
  class BaseFileVersionModule < BaseVersionModule
    def filename
      raise NotImplementedError, "Missing filename on #{name}"
    end

    def relevant?
      File.file?(File.expand_path(filename, @base_path))
    end

    def read
      @contents = File.read(File.expand_path(filename, @base_path))
      select(@contents)
    end

    def write(version)
      contents = compose(@contents, version)
      File.write(File.expand_path(filename, @base_path), contents)
    end

    def select(_contents)
      raise NotImplementedError, "Missing select on #{name}"
    end

    def compose(_contents, _version)
      raise NotImplementedError, "Missing compose on #{name}"
    end
  end
end
