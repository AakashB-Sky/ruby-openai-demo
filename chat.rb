# Write your solution here!
require "openai"
require "dotenv/load"

# instantiate a client
client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

# conversation loop

puts "How can I help you today? (Enter \"bye\" to end the conversation)"

# print separator line
75.times do 
  print "–"
end
print "\n"

user_query = gets.chomp

# prepare an array of messages
message_list = [
  {
    "role" => "user",
    "content" => user_query
  }
]

# Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

=begin
pp api_response
pp "<------------- Line Break ---------------->"
=end 

gpt_response = api_response.fetch("choices").[](0).fetch("message").fetch("content")
pp gpt_response
