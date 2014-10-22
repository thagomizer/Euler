require 'mechanize'
require 'yaml'
require 'csv'

config = YAML.load_file('/Users/aja/Projects/Euler/mechanize/secrets.yml')

agent = Mechanize.new

login_pg = agent.get("https://projecteuler.net/sign_in")

login_pg.form_with(:name => "sign_in_form") do |f|
  f.username = config['username']
  f.password = config['password']
  f['sign_in'] = "Sign In"            #STUPID STUPID STUPID
end.submit

friends_pg = agent.get("https://projecteuler.net/friends")

remove_links = friends_pg.links.select { |l| l.attributes["title"] =~ /Remove/ }

while remove_links.length > 0 do
  remove_links.first.click

  friends_pg = agent.current_page
  remove_links = friends_pg.links.select { |l| l.attributes["title"] =~ /Remove/ }
end

CSV.foreach("/Users/aja/projects/Euler/mechanize/sign_ups.csv") do |row|
  next if row[0] == "Timestamp"

  agent.post("https://projecteuler.net/friends", {:friend_key => row[2]})

  puts row[1]
end
