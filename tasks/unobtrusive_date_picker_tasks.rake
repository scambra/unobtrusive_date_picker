namespace :unobtrusive_date_picker do
  desc "Copy assets"
  task :install do
    require 'fileutils'
    orig = File.join(File.dirname(__FILE__), '../public')
    dest = File.join(Rails.root.to_s, 'public')

    %w(javascripts stylesheets).each do |folder|
      Dir[File.join(orig, folder, '*')].each {|file| FileUtils.cp_r file, File.join(dest, folder, File.basename(file))}
    end
    FileUtils.cp_r File.join(orig, 'images/.'), File.join(dest, 'images', 'datepicker')
  end
end