set :output, { :error => nil, :standard => nil }

# every :day, :at => '12:00am' do
#   rake "cron:passport_expires"
#   rake "cron:visa_expires"
# end

every 5.minutes do
  rake "cron:passport_expires"
  rake "cron:visa_expires"
end