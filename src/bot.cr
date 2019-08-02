require "discordcr"
require "./bot/utils/config_loader"
require "./bot/command_handler"
require "./bot/reaction_handler"
require "./bot/registry"
require "./bot/middleware/*"

ConfigLoader.load
client = Discord::Client.new(token: "Bot #{ENV["DISCORD_TOKEN"]}", client_id: 272825402379206657_u64)

client.on_message_create(
  ReactionHandler.new,
  DiscordMiddleware::Prefix.new(ENV["PREFIX"]),
  CommandHandler.new
)

START_TIME = Time.utc_now
client.run
