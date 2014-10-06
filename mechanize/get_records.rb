require 'mechanize'
require 'yaml'

config = YAML.load_file('/Users/aja/Projects/Euler/mechanize/secrets.yml')

participants = []
File.open("/Users/aja/projects/Euler/mechanize/participants.csv", "r") do |file|
  file.each_line do |line|
    participants << line.chomp
  end
end

agent = Mechanize.new

login_pg = agent.get("https://projecteuler.net/sign_in")

login_pg.form_with(:name => "sign_in_form") do |f|
  f.username = config['username']
  f.password = config['password']
  f['sign_in'] = "Sign In"            #STUPID STUPID STUPID
end.submit

progress = {}

participants.each do |user|
  agent.get("https://projecteuler.net/progress=#{user}")
  status = agent.page.search('#progress_bar_section h3').text
  status =~ /Solved (\d*)/
  progress[user] = $1
  progress[user] = 0 if progress[user].empty?
end

timestamp = Time.now.iso8601

File.open("/Users/aja/Projects/Euler/mechanize/records.csv", "a") do |file|
  file.puts
  progress.each do |user, score|
    file.puts "#{user}, #{score}, #{timestamp}"
  end
end
