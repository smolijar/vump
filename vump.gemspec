$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'root'

Gem::Specification.new do |s|
  s.name        = Vump::Meta.name
  s.version     = Vump::Meta.version
  s.homepage    = Vump::Meta.homepage
  s.license     = Vump::Meta.license
  s.author      = Vump::Meta.author
  s.email       = Vump::Meta.email

  s.summary     = Vump::Meta.summary
  s.description = Vump::Meta.description

  s.files = Dir['bin/*',
                'lib/**/*',
                '*.gemspec',
                'LICENSE*',
                'README*',
                'VERSION']
  s.executables = Dir['bin/*'].map { |f| File.basename(f) }

  s.required_ruby_version = '>= 2.2'

  s.add_runtime_dependency 'keepachangelog', '~> 0.5.3'

  s.add_development_dependency 'coveralls', '~> 0.8'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'rspec-cheki', '~> 0.1'
  s.add_development_dependency 'rubocop', '~> 0.60.1'
  s.add_development_dependency 'simplecov', '~> 0.12'
  s.add_development_dependency 'yard', '~> 0.9'
end
