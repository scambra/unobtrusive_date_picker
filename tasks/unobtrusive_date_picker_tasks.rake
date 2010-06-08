namespace :unobtrusive_date_picker do
  desc "Copy assets"
  task :install do
    require 'fileutils'
    orig = File.join(File.dirname(__FILE__), '../public')
    dest = File.join(Rails.root.to_s, 'public')

    %w(javascripts stylesheets).each do |folder|
      Dir[File.join(orig, folder, '**/*')].each do |file|
        if File.directory? file
          dir = File.join(dest, folder, File.basename(file))
          FileUtils.mkdir dir unless File.exists? dir
        else
          FileUtils.cp file, File.join(dest, file.gsub(orig, ''))
        end
      end
    end

    images_dir = File.join(dest, 'images', 'datepicker')
    FileUtils.mkdir images_dir unless File.exists? images_dir
    FileUtils.cp Dir[File.join(orig, 'images/*')], images_dir
  end
end
