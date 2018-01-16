require_relative '../lib/vump/semver/semver'

describe 'Semver construction' do
  context 'Simple digits' do
    subject { Vump::Semver.new('1.2.3').to_s }
    it { is_expected.to eql '1.2.3' }
  end
  context 'Mutliple digits' do
    subject { Vump::Semver.new('153.0.7777').to_s }
    it { is_expected.to eql '153.0.7777' }
  end
  context 'Sufix' do
    subject { Vump::Semver.new('0.0.0-sufix-135').to_s }
    it { is_expected.to eql '0.0.0-sufix-135' }
  end
  context 'Pre' do
    subject { Vump::Semver.new('0.0.0-1.2.3').to_s }
    it { is_expected.to eql '0.0.0-1.2.3' }
  end
  context 'Build' do
    subject { Vump::Semver.new('0.0.0+abc').to_s }
    it { is_expected.to eql '0.0.0+abc' }
  end
  context 'Pre and Build' do
    subject { Vump::Semver.new('0.0.0-alpha+build132').to_s }
    it { is_expected.to eql '0.0.0-alpha+build132' }
  end
end

describe 'Simple bump' do
  subject(:version) { Vump::Semver.new('0.0.0') }
  context 'Bump patch' do
    before { version.bump_patch }
    subject { version.to_s }
    it { is_expected.to eql '0.0.1' }
  end
  context 'Bump minor' do
    before { version.bump_minor }
    subject { version.to_s }
    it { is_expected.to eql '0.1.0' }
  end
  context 'Bump major' do
    before { version.bump_major }
    subject { version.to_s }
    it { is_expected.to eql '1.0.0' }
  end
end

describe 'Reset bump' do
  subject(:version) { Vump::Semver.new('2.2.2-pre+build') }
  context 'Bump patch' do
    before { version.bump_patch }
    subject { version.to_s }
    it { is_expected.to eql '2.2.3' }
  end
  context 'Bump minor' do
    before { version.bump_minor }
    subject { version.to_s }
    it { is_expected.to eql '2.3.0' }
  end
  context 'Bump major' do
    before { version.bump_major }
    subject { version.to_s }
    it { is_expected.to eql '3.0.0' }
  end
end
