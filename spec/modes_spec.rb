require 'fileutils'
require_relative '../lib/vump'


describe 'Mode results' do
  before do
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

    def relative_read(path)
      File.read(File.expand_path(path, __dir__))
    end
  end

  context 'VERSION' do
    subject(:ref) { relative_read 'files/reference/VERSION' }
    subject { relative_read 'tmp/VERSION' }
    it { is_expected.to eql ref }
  end

  context 'package.json' do
    subject(:ref) { relative_read 'files/reference/package.json' }
    subject { relative_read 'tmp/package.json' }
    it { is_expected.to eql ref }
  end
end
