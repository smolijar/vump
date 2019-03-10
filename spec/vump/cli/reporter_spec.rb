require 'vump/cli/reporter'

class FooModule; end
class BarModule; end

reporter = Vump::Reporter.new(verbose: true)

RSpec.describe Vump::Reporter do
  context 'report_preamble' do
    report = -> { reporter.report_preamble('__path__', '__arg__', '__opt__') }
    it 'Contains some header' do
      expect { report.call }.to output(/Vump/).to_stdout
    end
  end

  context 'report_module_overview' do
    reporter.add_loaded_modules([FooModule, BarModule])
    reporter.add_relevant_modules([FooModule])
    reporter.add_read_version(FooModule, '0.42.0')
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
