require "yaml"
require "discordcr"
require "./command_handler"

config = YAML.parse(File.read("config.yaml"))
client = Discord::Client.new(token: "Bot #{config["token"].as_s}", client_id: 272825402379206657_u64)
PREFIX = config["prefix"].as_s

command_handler = CommandHandler.new(client, PREFIX)

client.on_message_create do |message|
  command_handler.find_and_execute_command message
end

client.run
