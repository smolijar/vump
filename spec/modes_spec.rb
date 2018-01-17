require 'fileutils'
require 'logger'
require_relative '../lib/vump'
require 'date'

Vump.logger.level = Logger::WARN

# This is dirty and I don't like it
class Date
  def self.today
    '2018-01-17'
  end
end

describe 'Mode results' do
  before(:all) do
    # Copy files
    src = Dir[File.expand_path('files/test/*', __dir__)]
    dest = File.expand_path('tmp', __dir__)
    FileUtils.cp_r(src, dest)

    # Load modules, read versions
    v_modules, current_versions = Vump.modules(File.expand_path('tmp', __dir__))

    # Write versions with bumped patch
    v_modules.zip(current_versions).each do |mod, ver|
      semver = Vump::Semver.new(ver)
      semver.bump_patch
      mod.write(semver.to_s)
    end
  end

  def relative_read(path)
    File.read(File.expand_path(path, __dir__))
  end

  [
    'VERSION',
    'CHANGELOG.md',
    'package.json',
    'package-lock.json'
  ].each do |filename|
    context filename do
      subject(:ref) { relative_read "files/reference/#{filename}" }
      subject { relative_read "tmp/#{filename}" }
      it { is_expected.to eql ref }
    end
  end
end
