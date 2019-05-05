require 'vump/cli/reporter'
require 'vump/modules/base_module'

class FooModule < Vump::BaseModule
  def status
    :relevant
  end
end

class BarModule < Vump::BaseModule; end

reporter = Vump::Reporter.new(verbose: true)

RSpec.describe Vump::Reporter do
  context 'report_preamble' do
    report = -> { reporter.report_preamble('__path__', '__arg__', '__opt__') }
    it 'Contains some header' do
      expect { report.call }.to output(/Vump/).to_stdout
    end
  end

  context 'report_module_overview' do
    reporter.report_modules([FooModule.new(''), BarModule.new('')])
    reporter.add_read_version(FooModule.new(''), '0.42.0')
    it 'Contains loaded modules' do
      expect { reporter.report_module_overview }.to output(/FooModule/).to_stdout
      expect { reporter.report_module_overview }.to output(/BarModule/).to_stdout
    end
    it 'Status info' do
      expect { reporter.report_module_overview }.to output(/loaded/).to_stdout
      expect { reporter.report_module_overview }.to output(/relevant/).to_stdout
    end
    it 'Read version' do
      expect { reporter.report_module_overview }.to output(/0\.42\.0/).to_stdout
    end
  end
end
