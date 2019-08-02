require "discordcr"
require "./bot/utils/config_loader"
require "./bot/command_handler"
require "./bot/reaction_handler"
require "./bot/registry"

ConfigLoader.load
client = Discord::Client.new(token: "Bot #{ENV["DISCORD_TOKEN"]}", client_id: 272825402379206657_u64)
command_handler = CommandHandler.new(client, ENV["PREFIX"])
reaction_handler = ReactionHandler.new(client)

client.on_message_create do |message|
  # guild_id = message.guild_id
  # if !guild_id.nil?
  #   custom_emojis = client.get_guild_emojis(guild_id)
  #   pp custom_emojis
  #   nut_emoji = custom_emojis.select { |e| e.name == "nuts"}.first
  #   pp nut_emoji
  # else
  #   available_emojis = @client.get_guild_emojis(guild_id)
  #   p "available emojis"
  #   pp available_emojis
  # end
  reaction_handler.handle_message(message)
  command_handler.find_and_execute_command(message)
end

START_TIME = Time.utc_now
client.run
