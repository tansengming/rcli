require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/*_spec.rb']
  t.verbose = true
  t.warning = false
end

task default: :test