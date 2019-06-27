require "discordcr"
require "./utils/config_loader"
require "./handlers/*"

ConfigLoader.load
client = Discord::Client.new(token: "Bot #{ENV["DISCORD_TOKEN"]}", client_id: 272825402379206657_u64)
command_handler = CommandHandler.new(client, ENV["PREFIX"])
reaction_handler = ReactionHandler.new(client)

client.on_message_create do |message|
  reaction_handler.handle_message(message)
  command_handler.find_and_execute_command(message)
end

START_TIME = Time.utc_now
client.run
