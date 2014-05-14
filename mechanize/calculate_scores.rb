require 'pp'
require 'date'

class Record
  attr_accessor :user, :count, :timestamp, :score

  def initialize(user, count, timestamp)
    @user = user
    @count = count.to_i
    @timestamp = DateTime.rfc3339(timestamp)
    @score = 0
  end
end

records = []

File.open("records.csv", "r") do |file|
  file.each_line do |line|
    r = Record.new(*line.split(",").map(&:strip))
    records << r
  end
end

## normalize the scores
starting_values = {}

records.each do |r|
  if starting_values[r.user]
    r.score = r.count - starting_values[r.user]
  else
    starting_values[r.user] = r.count
  end
end

latest = {}

records.each do |r|
  unless latest[r.user]
    latest[r.user] = r
    next
  end

  if latest[r.user].timestamp < r.timestamp
    latest[r.user] = r
  end
end

latest.sort_by { |user, r| r.score }.each do |user, r|
  puts "#{user} - #{r.score}"
end
