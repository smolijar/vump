require File.expand_path('lib/vump/version', __dir__)
require File.expand_path('lib/vump/meta', __dir__)

Gem::Specification.new do |s|
  s.name        = 'vump'
  s.version     = Vump::VERSION
  s.homepage    = 'https://github.com/grissius/vump'
  s.license     = 'MIT'
  s.author      = 'Jaroslav Šmolík'
  s.email       = 'grissius@gmail.com'

  s.summary     = Vump::SUMMARY
  s.description = <<-DESCRIPTION
  Semantic version bumper. CLI tool to easily manage projects using semver and automate menial version raising.
DESCRIPTION

  s.files       = Dir['bin/*', 'lib/**/*', '*.gemspec', 'LICENSE*', 'README*', 'VERSION']
  s.executables = Dir['bin/*'].map { |f| File.basename(f) }
  s.has_rdoc    = 'yard'

  s.required_ruby_version = '>= 2.2'

  s.add_runtime_dependency 'keepachangelog', '~> 0.5.3'

  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'yard', '~> 0.9'
end
