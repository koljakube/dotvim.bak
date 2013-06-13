desc "symlink vim configuration files into the home directory and install git submodules"
task :link do
  %w{ vimrc gvimrc }.each do |file|
    File.symlink(File.expand_path(File.join('~', '.vim', file)), File.expand_path(File.join('~', ".#{file}")))
  end
  exec 'cd ~/.vim; git submodule init; git submodule update'
end

task :default => :link
