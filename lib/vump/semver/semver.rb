module Vump
  class Semver
    def initialize(string)
      # <numeral>[-<sufix>]
      version, sufix = string
                       .match(/([\d\.]+)(?:\-)?(.*)?/)
                       .captures
      # <sufix>:= [<pre>][+<build>]
      @pre, @build = sufix.split('+', 2).map { |s| s.empty? ? false : s }
      # <numeral>:= <major>.<minor>.<patch>
      @major, @minor, @patch = version
                               .match(/(\d+)\.(\d+)\.(\d+)/)
                               .captures
                               .map(&:to_i)
    end

    def bump_patch
      @pre = @build = false
      @patch += 1
    end

    def bump_minor
      @pre = @build = false
      @patch = 0
      @minor += 1
    end

    def bump_major
      @pre = @build = false
      @patch = 0
      @minor = 0
      @major += 1
    end

    def to_s
      str = "#{@major}.#{@minor}.#{@patch}"
      str << "-#{@pre}" if @pre
      str << "+#{@build}" if @build
      str
    end
  end
end
