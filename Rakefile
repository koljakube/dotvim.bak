desc "symlink vim configuration files into the home directory"
task :link do
  %w{ vimrc gvimrc }.each do |file|
    File.symlink(File.expand_path(File.join('~', '.vim', file)), File.expand_path(File.join('~', ".#{file}")))
  end
end

task :default => :link
