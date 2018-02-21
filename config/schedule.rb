job_type :runner,  "cd :path && bin/rails runner -e development ':task' :output"
set :output, "#{path}/log/cron.log"

every 1.minute do
  runner "Room.delete_inactive_rooms"
  #command "ls"
end
