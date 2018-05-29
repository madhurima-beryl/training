# app_path          = "/home/vmehta/projects/sellist"
# working_directory "#{app_path}"
# pid               "#{app_path}/tmp/pids/unicorn.pid"
# stderr_path       "#{app_path}/log/unicorn.log"
# stdout_path       "#{app_path}/log/unicorn.log"

# listen            "/tmp/sellist.sock"
# worker_processes  1
# timeout           600
# preload_app       true

app_path          = "/home/beryl/Desktop/training/rails/Hospital"
working_directory "#{app_path}"
pid "/#{app_path}/tmp/pids/unicorn.pid"
stderr_path "/#{app_path}/log/unicorn.log"
stdout_path "/#{app_path}/log/unicorn.log"

listen "/tmp/unicorn.sock"
worker_processes 2
timeout 30