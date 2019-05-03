require 'command_line_reporter'
require 'logger'
require 'vump/meta'

FRAGMENTS1 = <<'_'.freeze

                                                          |\__/,|   (`\
                                      Vump              _.|o o  |_   ) )
_
# rubocop:disable Layout/IndentHeredoc
FRAGMENTS2 = <<'_'.freeze
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━(((━━━(((━━━━━━━━━━━━━━━━
_
# rubocop:enable Layout/IndentHeredoc
module Vump
  class Reporter
    include CommandLineReporter

    def initialize(options)
      @modules = {}
      @level = ::Logger::INFO
      @level = ::Logger::DEBUG if options[:verbose]
      @level = ::Logger::UNKNOWN if options[:silent]
    end

    def report_modules(mods)
      mods.each { |m| @modules[m.name] = {status: m.status} }
    end

    def add_read_version(mod, version)
      @modules[mod.name][:read_version] = version
    end

    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/LineLength
    # rubocop:disable Metrics/CyclomaticComplexity
    def help
      puts 'vump'.bold.yellow + ' [<major|minor|patch|<semver-string>>] [...options]'.yellow
      header title: 'Available options:'
      table(border: false) do
        [
          ['-s, --silent', '', 'Restrict output'],
          ['-v, --version', '', 'Output Vump\'s version'],
          ['-h, --help', '', 'Print this help'],
          ['--no-git', '', 'Skip staging, commit and tag'],
          ['-t, --tag-prefix', '=@foo/v', 'Modify version string prefix for git tag (default "v")'],
          ['-b, --build', '=001', 'Set semver\'s build tag (default none)'],
          ['--pre', '=alpha1', 'Set semver\'s pre release tag (default none)'],
          ['--date', '=2020-12-20', 'Modify date of committing release. Used by changelog. (default now)'],
          ['-d, --dry', '', 'Dry run (no writes or CSV manipulation)'],
          ['-p, --path', '=/foo/bar', 'Path to the repo (default pwd)'],
        ].each do |option, arg, descr|
          row do
            column(option, width: 18, color: 'yellow')
            column(arg, width: 12, color: 'cyan')
            column(descr, width: 40)
          end
        end
      end
    end

    def report_preamble(base_path, arg, options)
      return if @level > ::Logger::INFO

      puts FRAGMENTS1.chomp.bold.yellow + ' ' + Meta.version.yellow
      puts FRAGMENTS2.chomp.bold.yellow
      puts "#{' ' * 27} Semantic version bumper\n".yellow

      return if @level > ::Logger::DEBUG

      table(border: false) do
        row do
          column('Base path', width: 10)
          column(base_path, width: 70)
        end
        row do
          column('Argument')
          column(arg)
        end
        row do
          column('Options')
          column(options)
        end
      end
    end

    def report_module_overview
      return if @level > ::Logger::INFO

      header title: 'Version module overview', align: 'center', width: 80
      table(border: true) do
        row do
          column('NAME', width: 20)
          column('STATUS', width: 30)
          column('READ VERSION', width: 20)
        end
        @modules.each do |name, data|
          status = data[:status]
          next if status === data[:loaded] && @level > ::Logger::DEBUG

          color = nil
          color = 'green' if status === :relevant
          color = 'cyan' if status === :ignored
          row do
            column(name)
            column(status.to_s, color: color)
            column(data[:read_version], color: color)
          end
        end
      end
    end

    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/LineLength
    # rubocop:enable Metrics/CyclomaticComplexity
  end
end
