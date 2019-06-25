require "yaml"
require "discordcr"
require "./handlers/*"

config = YAML.parse(File.read("config.yaml"))
token = config["token"].as_s
prefix = config["prefix"].as_s
client = Discord::Client.new(token: "Bot #{token}", client_id: 272825402379206657_u64)

command_handler = CommandHandler.new(client, prefix)
reaction_handler = ReactionHandler.new(client)

client.on_message_create do |message|
  reaction_handler.handle_message(message)
  command_handler.find_and_execute_command(message)
end

client.run
