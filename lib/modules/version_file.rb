require 'vump'

module Vump::VersionFile
  def self.relevant?(base_path)
    File.file?(File.expand_path('VERSION', base_path))
  end

  def self.read(base_path)
    contents = File.read(File.expand_path('VERSION', base_path))
    contents.strip
  end

  def self.write(base_path, version)
    File.write(File.expand_path('VERSION', base_path), "#{version}\n")
  end
end
