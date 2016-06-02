task :default => [:yaml_lint]

desc "run yaml linter"
task :yaml_lint do
  sh "find . -regex '.*yml' | xargs yaml-lint"
end
