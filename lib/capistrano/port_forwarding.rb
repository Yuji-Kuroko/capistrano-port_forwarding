require "capistrano/port_forwarding/version"

module Capistrano
  module PortForwarding
    # Your code goes here...
  end
end

# examples
# set :remote_forwards, %w[10022:example.com:22]

# http://www.techscore.com/blog/2014/12/03/capistrano3でプライベートリポジトリからデプロイする/
namespace :port_forwarding do
  task :remote_forwarding do
    remote_forwards = fetch(:remote_forwards, [])
    return if remote_forwards.empty?
    on roles(:all) do
      with_ssh do |ssh|
        remote_forwards.each do |arg|
          info " remote port forwarding #{arg} #{host}"
          args = arg.split(':').reverse
          args[0] = args[0].to_i if args[0]
          args[2] = args[2].to_i if args[2]
          ssh.forward.remote(*args)
        end
        ssh.exec!(':') #nop
        ssh.loop
      end
    end
  end
end
before 'deploy:starting', 'port_forwarding:remote_forwarding'
# deploy:check
before 'git:check', 'port_forwarding:remote_forwarding'