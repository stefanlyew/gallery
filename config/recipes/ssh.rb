load "config/recipes/base"

namespace :ssh do
  desc "Setup long timeouts for ssh connection"
  task :install, roles: :app do
    sshd = <<-BASHRC
  ClientAliveInterval 18
  ClientAliveCountMax 100
    BASHRC
    ssh = <<-BASHRC
  ServerAliveInterval 18
  ServerAliveCountMax 100
    BASHRC
    cmd = %Q{grep -R "ClientAliveInterval" /etc/ssh/sshd_config}
    content = capture( %Q{bash -c '#{cmd}' || echo "false"}).strip
    if content == 'false'
      put sshd, '/tmp/sshd'
      run 'cat /etc/ssh/sshd_config /tmp/sshd > /tmp/sshd.tmp'
      run 'rm /tmp/sshd'
      run "#{sudo} mv /tmp/sshd.tmp /etc/ssh/sshd_config"
      run "#{sudo} service ssh restart"
    else
      run 'echo "FILE /etc/ssh/sshd_config" IS ALREADY UPDATED!'
    end

    cmd2 = %Q{grep -R "ServerAliveInterval" /etc/ssh/ssh_config}
    content2 = capture( %Q{bash -c '#{cmd2}' || echo "false"}).strip
    if content2 == 'false'
      put ssh, '/tmp/ssh'
      run 'cat /etc/ssh/ssh_config /tmp/ssh > /tmp/ssh.tmp'
      run 'rm /tmp/ssh'
      run "#{sudo} mv /tmp/ssh.tmp /etc/ssh/ssh_config"
      run "#{sudo} service ssh restart"
    else
      run 'echo "FILE /etc/ssh/ssh_config" IS ALREADY UPDATED!'
    end

  end
  after "deploy:install", "ssh:install"
end