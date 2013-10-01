# set_default :ruby_version, "1.9.3-p194"
# set_default :use_rmagick, true

# namespace :rbenv do
#   desc "Install rbenv, Ruby, and the Bundler gem"
#   task :install, roles: :app do
#     run "#{sudo} apt-get update"
#     # from https://github.com/fesplugas/rbenv-installer/blob/master/bin/rbenv-bootstrap-ubuntu-12-04
#     ruby_deps = "build-essential zlib1g-dev libssl-dev libreadline-gplv2-dev"
#     rmagick_deps = "imagemagick libmagickcore-dev libmagickwand-dev" if use_rmagick
#     run "#{sudo} apt-get -yq install curl git-core #{ruby_deps} #{rmagick_deps}"
#     run "curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash"
#     bashrc = <<-BASHRC
# if [ -d $HOME/.rbenv ]; then 
#   export PATH="$HOME/.rbenv/bin:$PATH" 
#   eval "$(rbenv init -)" 
# fi
# BASHRC
#     put bashrc, "/tmp/rbenvrc"
#     run "cat /tmp/rbenvrc ~/.bashrc > ~/.bashrc.tmp"
#     run "mv ~/.bashrc.tmp ~/.bashrc"
#     set :default_environment, {
#       'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH",
#     }
   
   
#     run "rbenv install #{ruby_version}"
#     run "rbenv global #{ruby_version}"
#     run "gem install bundler --no-ri --no-rdoc"
#     run "rbenv rehash"
#   end
#   after "deploy:install", "rbenv:install"
# end