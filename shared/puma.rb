#!/usr/bin/env puma

ENV["BUNDLE_GEMFILE"] = '/home/ubuntu/travel-link/current/Gemfile'

directory '/home/ubuntu/travel-link/current'
environment 'production'
daemonize true
pidfile "/home/ubuntu/travel-link/shared/tmp/pids/puma.pid"
state_path "/home/ubuntu/travel-link/shared/tmp/pids/puma.state"
stdout_redirect '/home/ubuntu/travel-link/shared/log/puma_error.log', '/home/ubuntu/travel-link/shared/log/puma_access.log', true
threads 0,16
bind "unix:/home/ubuntu/travel-link/shared/tmp/sockets/puma.sock"

workers 0

preload_app!


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/ubuntu/travel-link/current/Gemfile"
end


