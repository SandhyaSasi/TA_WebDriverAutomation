require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:default => :cleanup) do |t|
  t.cucumber_opts = 'features --color --format pretty --tags ~@wip --format rerun -o features/output/rerun.txt --format html -o features/output/cucumber_report.html'
end

Cucumber::Rake::Task.new(:rerun) do |t|
  t.cucumber_opts = '-r features --color --format pretty @features/output/rerun.txt --format html -o features/output/rerun_cucumber_report.html'
end

task(:cleanup) { `rm features/output/*.*` }