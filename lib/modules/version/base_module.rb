require 'root'

module Vump
  class BaseVersionModule
    def initialize(base_path)
      @base_path = base_path
    end

    def relevant?
      false
    end

    def read
      raise NotImplementedError, "Missing read on #{name}"
    end

    def name
      self.class.name
    end

    def write(_version)
      raise NotImplementedError, "Missing write on #{name}"
    end
  end
end
