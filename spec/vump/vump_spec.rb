require 'vump/vump'
require 'git'

class TestModule
  def initialize(base_dir); end

  def relevant?
    true
  end

  def read
    '0.0.0'
  end

  def name
    self.class.name
  end

  def write(version)
    @@last_write = version
    true
  end

  def self.last_write
    @@last_write
  end
end

class IrrelevantTestModule < Vump::BaseVersionModule
  def initialize(base_dir); end

  def relevant?
    false
  end
end

vump = Vump::Vump.new('/', :minor, silent: true)
vump.logger.level = Logger::UNKNOWN

RSpec.describe vump.class.name do
  context 'real modules' do
    it 'all_modules' do
      expect(vump.all_modules).to be_an_instance_of(Array)
    end
  end
  context 'fake modules' do
    before :each do
      mods = [
        TestModule,
        IrrelevantTestModule,
      ]
      allow_any_instance_of(Vump::Vump).to(
        receive(:all_modules).and_return(mods)
      )
    end
    it 'load_modules' do
      expect(vump.load_modules.length).to be(1)
    end
    it 'read_versions' do
      expect(vump.read_versions(vump.load_modules)).to match_snapshot
    end
    it 'select_version' do
      expect(vump.select_version(%w[a b c])).to be_falsy
      expect(vump.select_version(%w[a])).to be_truthy
    end
    it 'start' do
      vump.start
      expect(TestModule.last_write).to eq('0.1.0')
    end
  end

  context 'integration tests' do
    sandbox_dir = File.expand_path('sandbox', __dir__)
    version_path = File.expand_path('VERSION', sandbox_dir)
    pre_commit_hook_path = File.expand_path('./.git/hooks/pre-commit', sandbox_dir)

    before :all do
      FileUtils.rm_rf(sandbox_dir)
      FileUtils.mkdir_p(sandbox_dir)
      git = Git.init(sandbox_dir)
      git.config('user.name', 'Vump test')
      git.config('user.email', 'vump@test.com')
    end
    after :all do
      FileUtils.rm_rf(sandbox_dir)
    end
    it 'flow with version' do
      git = Git.open(sandbox_dir)
      File.write(version_path, "0.0.0\n")
      git.add(version_path)
      git.commit('Initial commit')
      v = Vump::Vump.new(sandbox_dir, :minor, silent: true)
      v.start
      expect(git.gcommit('HEAD').message).to eql('Release version 0.1.0')
      expect(git.tags.first.name).to eql('0.1.0')
    end
    it 'fail commit on hook' do
      git = Git.open(sandbox_dir)
      File.write(pre_commit_hook_path, "exit 1\n")
      File.chmod(0777, pre_commit_hook_path)
      v = Vump::Vump.new(sandbox_dir, :minor, silent: true)
      v.start
      expect(git.gcommit('HEAD').message).to eql('Release version 0.1.0')
      expect(git.tags.first.name).to eql('0.1.0')
    end
  end
end
