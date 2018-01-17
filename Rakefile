desc 'Install gems using bundler'
task :install do
  run 'bundle install'
end

desc 'Run tests'
task test: :install do
  run 'bundle exec rspec spec'
end

desc 'Check coding style'
task cs: :install do
  run 'bundle exec rubocop'
end

def run(*args)
  Rake.sh(*args, verbose: false)
end
