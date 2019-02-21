require 'vump/logger/logger'
require 'logger'

io = StringIO.new
logger = Vump::Logger.new(out: io)

RSpec.describe Vump::Logger do
  context 'info' do
    after(:each) do
      logger.level = ::Logger::DEBUG
      io.reopen('')
    end
    it 'outputs' do
      logger.info('foo')
      expect(io.string).to eq("foo\n")
    end
    it 'is silent on higher level' do
      logger.level = ::Logger::WARN
      logger.info('foo')
      expect(io.string).to eq('')
    end
    it 'is silent on higher level' do
      logger.info('foo', 'bar')
      expect(io.string).to eq("[bar] foo\n")
    end
  end
  context 'error' do
    after(:each) do
      logger.level = ::Logger::DEBUG
      io.reopen('')
    end
    it 'outputs' do
      logger.error('foo')
      expect(io.string).to eq("foo\n")
    end
  end
end
