# frozen_string_literal: true

desc 'run all tasks'
task default: %i[rubocop yaml_lint]

desc 'run markdown linter'
task :md_lint do
  sh "find . -regex '.*md' | xargs mdl -c .mdlrc"
end

require 'rubocop/rake_task'
desc 'run ruby linter'
RuboCop::RakeTask.new

desc 'run yaml linter'
task :yaml_lint do
  sh "find . -not -path './vendor/*' -regex '.*yml' | xargs yaml-lint"
end

desc 'run super-linter'
task :super_linter do
  sh 'docker run'\
    ' -e RUN_LOCAL=true'\
    ' -e VALIDATE_HTML=false'\
    ' -e VALIDATE_MARKDOWN=false'\
    ' -e VALIDATE_JSCPD=false'\
    ' -e VALIDATE_RUBY=false'\
    ' -e FILTER_REGEX_EXCLUDE=.*_site/.*'\
    ' -v ~/Documents/github/zeljkofilipin/filipin.eu:/tmp/lint github/super-linter'
end
