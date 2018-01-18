module Vump
  module VersionModules
    module VcsModules
      # Git VCS module
      class Git
        def self.revise(modules, release_version)
          return unless File.exist?(Dir.pwd + '/.git')
          modules.each { |m| `git add #{m.path}` }
          msg = "Release #{release_version}"
          tag = "v#{release_version}"
          `git commit -m "#{msg}"` unless modules.empty?
          Vump.logger.info "Git commit \"#{msg}\" created"
          `git tag "#{tag}"`
          Vump.logger.info "Git tag \"#{tag}\" created"
        end
      end
    end
  end
end
