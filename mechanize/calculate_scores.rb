require 'pp'
require 'date'

class Record
  attr_accessor :count, :timestamp

  def initialize(count, timestamp)
    @count = count.to_i
    @timestamp = DateTime.rfc3339(timestamp)
  end
end

class User
  attr_accessor :username, :initial_count, :records, :score

  def initialize(username)
    @user = username
    @records = []
    @score = 0
  end

  def add_record(count, timestamp)
    @records << Record.new(count, timestamp)

    if records.length == 1
      @initial_count = count.to_i
    end

    @score = count.to_i - @initial_count
  end
end

users = Hash.new { |h, k| h[k] = User.new(k) }

File.open("records.csv", "r") do |file|
  file.each_line do |line|
    username, count, timestamp = line.split(",").map(&:strip)

    users[username].add_record(count, timestamp)
  end
end

## Calculate and print scores

scores = users.map { |username, u| [username, u.score] }
scores = scores.sort_by { |u, score| score }.reverse

File.open("scores.csv", "w") do |f|
  scores.each do |u, s|
    f.puts "#{u}, #{s}"
  end
end
