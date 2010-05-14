require 'rake'

begin
  puts "============================================================="
  puts "Attempting to install required files into your application..."
  puts "============================================================="
  RAKE_FILE = File.expand_path(File.join(File.dirname(__FILE__), 'tasks', 'unobtrusive_date_picker.rake'))
  load RAKE_FILE

  Rake::Task['unobtrusive_date_picker:install'].invoke
  puts "=========================================================="
  puts "Success!"
  puts "=========================================================="
rescue Exception => ex
  puts "FAILED TO INSTALL REQUIRED FILES. PLEASE RUN rake unobtrusive_date_picker:install."
  puts "EXCEPTION: #{ex}"
end
