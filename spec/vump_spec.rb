require 'vump'

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

  def write(v)
    @@last_write = v
    true
  end

  def self.last_write
    @@last_write
  end
end
class IrrelevantTestModule
  def initialize(base_dir); end

  def relevant?
    false
  end
end
class Vump::Vump
  def all_modules
    [
      TestModule,
      IrrelevantTestModule
    ]
  end
end
vump = Vump::Vump.new('/', :minor, {})
vump.logger.logger.level = Logger::UNKNOWN

RSpec.describe vump.class.name, type: :request do
  before :each do
    mods = [
      TestModule,
      IrrelevantTestModule
    ]
    allow_any_instance_of(Vump::Vump).to receive(:all_modules).and_return(mods)
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
