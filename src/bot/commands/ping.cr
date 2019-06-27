struct PingCommand < Bot::BaseCommand
  self.name = "ping"
  self.description = "Pings the bot"

  def self.execute(args : Array(String)?)
    Discord::Embed.new(description: "Pong!", colour: EmbedColors.green)
  end
end
