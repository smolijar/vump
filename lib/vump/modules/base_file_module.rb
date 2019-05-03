require 'vump/modules/base_module'

module Vump
  class BaseFileModule < BaseModule
    def filename
      raise NotImplementedError, "Missing filename on #{name}"
    end

    def file_path
      File.expand_path(filename, @base_path)
    end

    def relevant?
      status === :relevant
    end

    def status
      status = :loaded
      status = :relevant if File.file?(file_path)
      status = :ignored if @options[:git] && @options[:git].ignored?(file_path)
      status
    end

    def to_stage
      [file_path]
    end

    def read
      return nil unless File.file?(file_path)
      @contents = File.read(file_path)
      select(@contents)
    end

    def write(version)
      contents = compose(@contents, version)
      File.write(file_path, contents) unless @options[:dry]
    end

    def select(_contents)
      raise NotImplementedError, "Missing select on #{name}"
    end

    def compose(_contents, _version)
      raise NotImplementedError, "Missing compose on #{name}"
    end
  end
end
