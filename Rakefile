desc "run all tasks"
task :default => [:yaml_lint]

desc "run markdown linter"
task :md_lint do
  sh "find . -regex '.*md' | xargs mdl -c .mdlrc"
end

desc "run yaml linter"
task :yaml_lint do
  sh "find . -regex '.*yml' | xargs yaml-lint"
end
