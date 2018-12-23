$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'root'

Gem::Specification.new do |s|
  s.name        = Vump.name
  s.version     = Vump.version
  s.homepage    = Vump.homepage
  s.license     = Vump.license
  s.author      = Vump.author
  s.email       = Vump.email

  s.summary     = Vump.summary
  s.description = Vump.description

  s.files = Dir['bin/*',
                'lib/**/*',
                '*.gemspec',
                'LICENSE*',
                'README*',
                'VERSION']
  s.executables = Dir['bin/*'].map { |f| File.basename(f) }

  s.required_ruby_version = '>= 2.2'

  s.add_runtime_dependency 'keepachangelog', '~> 0.5.3'

  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'yard', '~> 0.9'
  s.add_development_dependency 'rspec-cheki', '~> 0.1'
  s.add_development_dependency 'simplecov', '~> 0.12'
  s.add_development_dependency 'coveralls', '~> 0.8'
end
