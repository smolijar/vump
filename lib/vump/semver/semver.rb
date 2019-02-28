module Vump
  class Semver
    attr_accessor :major, :patch, :minor, :pre, :build

    def initialize(string = nil)
      @pre = @build = false
      @major = @minor = @patch = 0
      @valid = false
      load string if string
    end

    def load(string)
      # <numeral>[-<pre>][+<build>]
      version, @pre, @build = string
        .match(/([\d\.]+)(?:\-)?([^\+]*)(?:\+)?(.*)?/)
        .captures
      # <numeral>:= <major>.<minor>.<patch>
      @major, @minor, @patch = version
        .match(/(\d+)\.(\d+)\.(\d+)/)
        .captures
        .map(&:to_i)
      @valid = true
    rescue StandardError
      @valid = false
    end

    def valid?
      @valid
    end

    def reset(what)
      levels = %i[@build @pre @patch @minor @major]
      # tag to false, version to 0
      reset_to = %i[@build @pre].include?(what) ? false : 0
      instance_variable_set(what, reset_to)
      # reset lesser sections
      reset levels[levels.index(what) - 1] if levels.index(what) != 0
    end

    def bump_patch
      reset :@pre
      @patch += 1
    end

    def bump_minor
      reset :@patch
      @minor += 1
    end

    def bump_major
      reset :@minor
      @major += 1
    end

    def bump(what)
      case what
      when :patch
        bump_patch
      when :minor
        bump_minor
      when :major
        bump_major
      end
    end

    def to_s
      str = "#{@major}.#{@minor}.#{@patch}"
      str << "-#{@pre}" if @pre && @pre != ''
      str << "+#{@build}" if @build && @build != ''
      str
    end
  end
end
