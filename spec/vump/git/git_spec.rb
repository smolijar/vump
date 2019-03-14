require 'git'
require 'vump/git/git'
require 'fileutils'

sandbox_dir = File.expand_path('sandbox', __dir__)
readme_path = File.expand_path('README.md', sandbox_dir)

RSpec.describe '' do
  before :all do
    FileUtils.rm_rf(sandbox_dir)
    FileUtils.mkdir_p(sandbox_dir)
  end
  after :all do
    FileUtils.rm_rf(sandbox_dir)
  end
  context 'initialize' do
    it 'Not loaded when opened with no .git' do
      g = Vump::Git.new(sandbox_dir)
      expect(g.loaded?).to eql(false)
    end
    it 'After init, is loaded' do
      git = Git.init(sandbox_dir)
      git.config('user.name', 'Vump test')
      git.config('user.email', 'vump@test.com')
      File.write(readme_path, '# Foo')
      git.add(readme_path)
      git.commit('Initial commit')
      vit = Vump::Git.new(sandbox_dir)
      expect(vit.loaded?).to eql(true)
    end
  end
  context 'manipulation' do
    it 'stage and commit' do
      vit = Vump::Git.new(sandbox_dir)
      File.write(readme_path, '# Bar')
      git = Git.open(sandbox_dir)
      expect(git.status.changed['README.md'].sha_index).to eql('0000000000000000000000000000000000000000')
      vit.stage(readme_path)
      # is staged
      expect(git.status.changed['README.md'].sha_index).to eql('453874c93eff2165afc914539ff19198e1942c4f')
      commit_message = vit.commit('v42')
      # is committed
      expect(commit_message).to eql(git.gcommit('HEAD').message)
    end
    it 'tags' do
      vit = Vump::Git.new(sandbox_dir)
      git = Git.open(sandbox_dir)
      # no tags now
      expect(git.tags).to eql([])
      vit.tag('v42')
      # tag with correct name
      expect(git.tags.first.name).to eql('v42')
      # tag on HEAD
      expect(git.tags.first.sha).to eql(git.gcommit('HEAD').sha)
    end
  end
end
