# frozen_string_literal: true

desc 'run all tasks'
task default: %i[super_linter]

desc 'run super-linter'
task :super_linter do
  sh 'docker run'\
    ' -e RUN_LOCAL=true'\
    ' -e VALIDATE_BIOME_FORMAT=false'\
    ' -e VALIDATE_BIOME_LINT=false'\
    ' -e VALIDATE_CHECKOV=false'\
    ' -e VALIDATE_GITHUB_ACTIONS_ZIZMOR=false'\
    ' -e VALIDATE_GITLEAKS=false'\
    ' -e VALIDATE_HTML=false'\
    ' -e VALIDATE_HTML_PRETTIER=false'\
    ' -e VALIDATE_JSCPD=false'\
    ' -e VALIDATE_MARKDOWN=false'\
    ' -e VALIDATE_MARKDOWN_PRETTIER=false'\
    ' -e VALIDATE_NATURAL_LANGUAGE=false'\
    ' -e VALIDATE_RUBY=false'\
    ' -e VALIDATE_SPELL_CODESPELL=false'\
    ' -e VALIDATE_TRIVY=false'\
    ' -e FILTER_REGEX_EXCLUDE=.*(_site|vendor/bundle)/.*'\
    " -v #{__dir__}:/tmp/lint ghcr.io/super-linter/super-linter:v8"
end
