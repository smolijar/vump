require 'vump'

class Vump::VersionFile
  def initialize(base_path)
    @base_path = base_path
  end

  def relevant?
    File.file?(File.expand_path('VERSION', @base_path))
  end

  def read
    contents = File.read(File.expand_path('VERSION', @base_path))
    contents.strip
  end

  def name
    self.class.name
  end

  def write(version)
    File.write(File.expand_path('VERSION', @base_path), "#{version}\n")
  end
end
