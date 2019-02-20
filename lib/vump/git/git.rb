require 'git'

module Vump
  class Git
    def initialize(base)
      @git = ::Git.open(base)
    rescue ArgumentError
      @git = nil
    end

    def loaded?
      !@git.nil?
    end

    def stage(files)
      @git.add(files)
    end

    def commit(version)
      message = "Release version #{version}"
      result = @git.commit(message)
      result == '' ? false : message
    end

    def tag(version_tag)
      @git.add_tag(version_tag)
    end
  end
end
