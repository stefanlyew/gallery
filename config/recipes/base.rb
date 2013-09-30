def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end


def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy  do
	task :install do
		run "#{sudo} apt-get -y update"
		run "#{sudo} apt-get -y install vim curl git-core software-properties-common"
	end
end

def add_apt_repository(repo)
  run "#{sudo} add-apt-repository #{repo}", :pty => true do |ch, stream, data|
    if data =~ /Press.\[ENTER\].to.continue/
	  ch.send_data(Capistrano::CLI.password_prompt("Press enter to continue:") + "\n")
      #ch.send_data("\n")
    else
      Capistrano::Configuration.default_io_proc.call(ch, stream, data)
    end
  end
end