require 'twitter' # ligne très importante qui appelle la gem.
require 'dotenv'# Appelle la gem Dotenv
require 'pry'


Dotenv.load('.env') # Ceci appelle le fichier .env (situé dans le même dossier que celui d'où tu exécute app.rb)


# quelques lignes qui appellent les clés d'API de ton fichier .env
client = Twitter::REST::Client.new do |config|
 config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
 config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
 config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
 config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end


client.search("#bonjour_monde", result_type: "recent").take(10).each do |tweet|
  client.follow(tweet.user)
  puts "#{tweet.user.screen_name}"
end

tweets = client.favorite(client.search("#bonjour_monde", result_type: "recent").take(25))
#client.favorite(tweets)
puts tweets

#collecter les statuts ?
#client.search("#bonjour_monde", result_type: "recent").take(20).collect do |status|
#  puts "#{status.user.screen_name}: #{status.text}"
#end
