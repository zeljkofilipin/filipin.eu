# frozen_string_literal: true

desc 'run all tasks'
task default: %i[super_linter]

desc 'run super-linter'
task :super_linter do
  sh 'docker run'\
    ' -e RUN_LOCAL=true'\
    ' -e VALIDATE_GITLEAKS=false'\
    ' -e VALIDATE_HTML=false'\
    ' -e VALIDATE_JSCPD=false'\
    ' -e VALIDATE_MARKDOWN=false'\
    ' -e VALIDATE_NATURAL_LANGUAGE=false'\
    ' -e FILTER_REGEX_EXCLUDE=.*_site/.*'\
    ' -v ~/Documents/github/zeljkofilipin/filipin.eu:/tmp/lint github/super-linter'
end
