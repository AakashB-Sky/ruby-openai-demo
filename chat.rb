# Write your solution here!
require "openai"
require "dotenv/load"

# instantiate a client
client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

# create array of messages
message_list = Array.new

puts "How can I help you today? (Enter \"bye\" to end the conversation)"

# conversation loop
end_conversation = false

while not end_conversation # don't forget to add `end`
  # print separator line
  75.times do 
    print "–"
  end
  print "\n"

  user_query = gets.chomp
  puts "\n"
  
  # leave loop if user says "bye"
  if user_query == "bye"
    puts "Have a nice day!"
  end_conversation = true
  else
    # prepare an array of messages
    message_list.push({:role => "user", :content => user_query})

    # Call the API to get the next message from GPT
    api_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: message_list
      }
    )

    gpt_response = api_response.fetch("choices").[](0).fetch("message").fetch("content")
    message_list.push({:role => "assistant", :content => gpt_response})
    puts gpt_response
  end
end
