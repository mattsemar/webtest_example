
require "rubygems"
gem "rspec", "=1.2.8"
require 'rake'
require 'spec/rake/spectask'

gem "selenium-client", "=1.2.17"
require "selenium/rake/tasks"

# Make sure we pick up the reporter from the appropriate selenium-client install
# as RSpec runner --require does not discriminate between multiple
# selenium-client gems.
gem_executable = Config::CONFIG["host_os"] =~ /mswin/ ? "gem.bat" : "gem"
report_formatter_path = `#{gem_executable} which -q "selenium/rspec/reporting/selenium_test_report_formatter"`.chomp
report_formatter_path.gsub! /selenium-client-\d+\.\d+.\d+/, "selenium-client-1.2.17"



desc 'Run acceptance tests for web application'
Spec::Rake::SpecTask.new(:'test:acceptance:web') do |t|
  t.libs << "test"
  t.spec_files =   FileList['**/*_spec.rb']
  t.spec_opts << '--color'
  t.spec_opts << "--require 'rubygems,selenium/rspec/reporting/selenium_test_report_formatter'"
  t.spec_opts << "--format=Selenium::RSpec::SeleniumTestReportFormatter:./tmp/rspec_report/acceptance_tests_report.html"
  t.spec_opts << "--format=progress"
  t.verbose = false
end


task :'test:acceptance:web' => [ :create_report_dir, 'selenium:rc:start' ]


task :default => :'test:acceptance:web'


ENV['DYLD_LIBRARY_PATH'] = "#{ENV['DYLD_LIBRARY_PATH']}:/usr/lib"
Selenium::Rake::RemoteControlStartTask.new do |rc|
  rc.port = 4444
  rc.timeout_in_seconds = 3 * 60
  rc.background = true
  rc.wait_until_up_and_running = true
  rc.jar_file = "./rc/selenium-server.jar"
  #  rc.additional_args << "-singleWindow -firefoxProfileTemplate ./rc/selenium-ff-profile"
#  rc.additional_args << "-firefoxProfileTemplate ../selenium-ff-profile"
  rc.additional_args << "-firefoxProfileTemplate ./selenium-ff-profile"

end

Selenium::Rake::RemoteControlStopTask.new do |rc|
  rc.host = "localhost"
  rc.port = 4444
  rc.timeout_in_seconds = 3 * 60
end


task :create_report_dir  do
  rm_f File.expand_path(File.dirname(__FILE__) + "/tmp/rspec_report")
  mkdir_p File.expand_path(File.dirname(__FILE__) + "/tmp/rspec_report")

end

desc "Check whether you installed all dependencies and you environmnet is OK."
task :sanity_check do
  require report_formatter_path
  STDOUT.puts <<-EOS

 Congratulations, your environment is set properly.

 Run the tests in parallel with:

   rake test:acceptance:web
  EOS
end