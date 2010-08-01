require 'rake'

task :default => :install

backup_path = File.join(File.dirname(__FILE__), 'backup')
dotfiles_path = File.dirname(__FILE__), 'dotfiles'

desc "Installs dotfiles in user's home folder"
task :install do
  # Option: automatically move stuff to backup, or ask user what should be done
  backup = false
  home = ENV['HOME']

  puts "Linking dotfiles..."

  Dir.glob(File.join(dotfiles_path, '*')) do |filename_with_path|
    filename = filename_with_path.split('/').last
    dotfile = File.join(home, ".#{filename}")

    unless File.directory?(filename_with_path)
      if File.identical?(filename_with_path, dotfile)
        puts "[identical] #{dotfile} is already linked"
        next
      elsif File.exist?(dotfile)
        puts "[exist] Backing up #{dotfile}"
        mv dotfile, "#{backup_path}/#{filename}"
        backup = true
      end
    end

    puts "[linking] #{filename_with_path} > #{dotfile}"
    ln_s filename_with_path, dotfile
  end

  if backup
    puts "Several files were backed up. Tell user how to restore."
  end
end

desc "Restore user's home folder to original state"
task :uninstall do
  # rm dotfiles from home filder
  # mv baggage/backup naar home folder
end