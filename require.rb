$:.unshift

require "rubygems"
require "spec"
require "selenium/client"
require "selenium/rspec/spec_helper"
require "selenium"

require "log4r"

require 'ruby-debug'



ROOT = "#{File.dirname(__FILE__)}/" unless defined?(ROOT)

EXCLUSIONS = [ 'require.rb',  'ui_maps.*', 'spec_helper.rb', '.*spec.rb', 'tmp*', "console*" ]

# #$console_loaded = false

Dir["#{ROOT}/**/*.rb"].uniq.each do |file|
  next if EXCLUSIONS.find{ |e| file =~ /#{e}/}
  puts "Including: #{file}"
  require file
end


$logger = Log4r::Logger.new("unit_test" )
pf = Log4r::PatternFormatter.new(:pattern => "%l %m", :date_pattern => "%H:%M:%S")
file = Log4r::FileOutputter.new('fileOutputter', :filename => 'unit_test.log', :trunc => false, :formatter => pf)
file.level = Log4r::DEBUG

Log4r::Outputter.stdout.formatter = pf
Log4r::Outputter.stdout.level = Log4r::INFO
$logger.outputters = [ Log4r::Outputter.stdout, file ]
# #$logger.level = Log4r::INFO

