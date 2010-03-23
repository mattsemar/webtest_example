require 'rubygems'
require 'thor'
require 'thor/group'

gem "rspec", "=1.2.8"
require 'rake'
require 'spec/rake/spectask'

gem "selenium-client", "=1.2.17"
require "selenium/rake/tasks"


Selenium::Rake::RemoteControlStartTask.new do |rc|
  rc.port = 4444
  rc.timeout_in_seconds = 3 * 60
  rc.background = true
  rc.wait_until_up_and_running = true
  rc.jar_file = "./rc/selenium-server.jar"
  #  rc.additional_args << "-singleWindow -firefoxProfileTemplate ./rc/selenium-ff-profile"
  #  rc.additional_args << "-firefoxProfileTemplate ../selenium-ff-profile"
  #  rc.additional_args << "-firefoxProfileTemplate ./selenium-ff-profile"
end

Selenium::Rake::RemoteControlStopTask.new do |rc|
  rc.host = "localhost"
  rc.port = 4444
  rc.timeout_in_seconds = 3 * 60
end


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

class Tests < Thor
  include Thor::Actions

  default_task :all

  desc 'all CLIENT', "Perform tests using selenium"
  method_options :client => "clorox", :required => true, :type => :string, :aliases => "-c"
  def all()
    create_report_dir
    rc_start
    execute(options[:client])
    puts "open #{File.join(File.expand_path(File.dirname(__FILE__) + '/tmp/rspec_report'), 'acceptance_tests_report.html')}"
  end

  desc 'create_report_dir', "Create the directory where the html report will be stored."

  def create_report_dir
    remove_dir File.expand_path(File.dirname(__FILE__) + "/tmp/rspec_report")
    empty_directory File.expand_path(File.dirname(__FILE__) + "/tmp/rspec_report")
  end

  desc 'rc_start', "Start the selenium remote control process"
  def rc_start
    Rake::Task["selenium:rc:start"].execute
  end

  desc 'rc_stop', "Stop the selenium remote control process"

  def rc_stop
    begin
      Rake::Task["selenium:rc:stop"].execute
    rescue Exception
    end
  end

  desc 'execute [CLIENT]', "Run the selenium tests for CLIENT"
  method_options :client => "clorox", :required => true, :type => :string, :aliases => "-c"
  def execute(client=options[:client])
    ENV["CLIENT"] = client
    Rake::Task["test:acceptance:web"].execute
  end

end

