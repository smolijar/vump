require 'root'

def construct(str)
  Vump::Semver.new(str).to_s
end

RSpec.describe Vump::Semver.name do
  context 'initialize' do
    it 'empty' do
      str = '0.0.0'
      expect(construct(str)).to eq(str)
    end
    it 'mutliple digits' do
      str = '53.0.7777'
      expect(construct(str)).to eq(str)
    end
    it 'sufix' do
      str = '0.0.0-sufix-135'
      expect(construct(str)).to eq(str)
    end
    it 'pre' do
      str = '0.0.0-1.2.3'
      expect(construct(str)).to eq(str)
    end
    it 'build' do
      str = '0.0.0+abc'
      expect(construct(str)).to eq(str)
    end
    it 'pre and build' do
      str = '0.0.0-alpha+build132'
      expect(construct(str)).to eq(str)
    end
  end

  context 'bump simple' do
    subject(:version) { Vump::Semver.new('0.0.0') }
    it 'patch' do
      version.bump_patch
      expect(version.to_s).to eq('0.0.1')
    end
    it 'minor' do
      version.bump_minor
      expect(version.to_s).to eq('0.1.0')
    end
    it 'major' do
      version.bump_major
      expect(version.to_s).to eq('1.0.0')
    end
  end

  context 'bump with resets' do
    subject(:version) { Vump::Semver.new('2.2.2-pre+build') }
    it 'patch' do
      version.bump_patch
      expect(version.to_s).to eq('2.2.3')
    end
    it 'minor' do
      version.bump_minor
      expect(version.to_s).to eq('2.3.0')
    end
    it 'major' do
      version.bump_major
      expect(version.to_s).to eq('3.0.0')
    end
  end
end
