require 'vump/modules/version/base_file_module'

VERSION = 'foo'.freeze
NEW_VERSION = 'bar'.freeze
PATH = File.expand_path('sandbox', __dir__)
TARGET = 'sample.txt'.freeze
CONTENTS = "Current version is #{VERSION}\n".freeze
TARGET_PATH = File.expand_path(TARGET, PATH).freeze

class SampleFileVersionModule < Vump::BaseFileVersionModule
  def filename
    TARGET
  end

  def select(contents)
    contents.gsub('Current version is', '').strip
  end

  def compose(contents, version)
    contents.gsub(VERSION, version)
  end
end

mocked_mod = SampleFileVersionModule.new(PATH)
mod = Vump::BaseFileVersionModule.new(PATH)

RSpec.describe Vump::BaseModule do
  context 'bare' do
    it 'filename' do
      expect { mod.filename }.to raise_error(NotImplementedError)
    end
    it 'to_stage' do
      expect { mod.to_stage }.to raise_error(NotImplementedError)
    end
    it 'select' do
      expect { mod.select('') }.to raise_error(NotImplementedError)
    end
    it 'compose' do
      expect { mod.compose('', '') }.to raise_error(NotImplementedError)
    end
  end
  context 'mocked' do
    before :each do
      File.write(TARGET_PATH, CONTENTS)
    end
    after :each do
      File.write(TARGET_PATH, CONTENTS)
    end
    it 'relevant?' do
      expect(mocked_mod.relevant?).to eql(true)
    end
    it 'filename' do
      expect(mocked_mod.filename).to eql(TARGET)
    end
    it 'read' do
      expect(mocked_mod.read).to eql(VERSION)
    end
    it 'write' do
      mocked_mod.write(NEW_VERSION)
      expect(mocked_mod.read).to eql(NEW_VERSION)
    end
  end
end
