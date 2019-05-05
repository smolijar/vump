module Vump
  class BaseModule
    def initialize(base_path, options = {})
      @base_path = base_path
      @options = options
    end

    def status
      :loaded
    end

    def relevant?
      false
    end

    def to_stage
      raise NotImplementedError, "Missing to_stage on #{name}"
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
