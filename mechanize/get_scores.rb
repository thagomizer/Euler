require 'mechanize'
require 'yaml'

config = YAML.load_file('secrets.yml')

agent = Mechanize.new

login_pg = agent.get("https://projecteuler.net/login")

login_pg.form_with(:name => "login_form") do |f|
  f.username = config['username']
  f.password = config['password']
  f['login'] = "Login"            #STUPID STUPID STUPID
end.submit

friends_pg = agent.get("https://projecteuler.net/friends")

usernames = friends_pg.links_with(:href => /progress=/).map { |l| l.text }

progress = {}

usernames.each do |user|
  agent.get("https://projecteuler.net/progress=#{user}")
  status = agent.page.search('#progress_bar_section h3').text
  status =~ /Solved (\d*)/
  progress[user] = $1
  progress[user] = 0 if progress[user].empty?
end

timestamp = Time.now.iso8601

progress.each do |user, score|
  puts "#{user}, #{score}, #{timestamp}"
end
