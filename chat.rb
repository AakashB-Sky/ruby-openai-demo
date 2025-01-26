# Write your solution here!
require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

puts "How can I help you today?"

# print separator line
75.times do 
  print "–"
end
print "\n"
