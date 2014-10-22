require 'pp'
require 'date'
require 'csv'

class Record
  attr_accessor :count, :timestamp

  def initialize(count, timestamp)
    @count = count.to_i
    @timestamp = DateTime.rfc3339(timestamp)
  end
end

class User
  attr_accessor :username, :initial_count, :records, :score, :division

  def initialize(username)
    @username = username
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

  def to_s
    "***#{self.username}***"
  end

  def inspect
    "---#{self.username}---"
  end

end

users = Hash.new { |h, k| h[k] = User.new(k) }

File.open("records.csv", "r") do |file|
  file.each_line do |line|
    username, count, timestamp = line.split(",").map(&:strip)

    next unless [username, count, timestamp].all?

    users[username].add_record(count, timestamp)
  end
end

CSV.foreach("/Users/aja/projects/Euler/mechanize/sign_ups.csv") do |row|
  next if row[0] == "Timestamp"

  users[row[1]].division = row[4]
end

## Calculate and print scores

users_by_div = users.values.group_by { |u| u.division }
scores_by_div = Hash[users_by_div.map { |div, ary| [div, ary.sort_by { |u| u.score }.reverse]}]


File.open("scores.csv", "w") do |f|
  scores_by_div.each do |div, users|
    f.puts div
    f.puts "---------"
    users.each do |u|
      f.puts "#{u.username} #{u.score}"
    end

    f.puts
    f.puts
  end
end
