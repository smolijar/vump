require 'root'

class Vump::VersionFile < Vump::BaseFileVersionModule
  def filename
    'VERSION'
  end

  def select(contents)
    contents.strip
  end

  def compose(_contents, version)
    "#{version}\n"
  end
end
