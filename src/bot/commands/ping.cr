struct PingCommand < Bot::BaseCommand
  self.name = "ping"
  self.description = "Pings the bot"
  self.usage = "ping"

  def self.execute(args : Array(String)?)
    Discord::Embed.new(description: "Pong!", colour: EmbedColors.green)
  end
end
