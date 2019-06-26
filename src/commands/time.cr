struct TimeCommand < Bot::Command
  self.name = "time"
  self.description = "Displays the bot's time"

  def self.execute(args : Array(String)?)
    Discord::Embed.new(description: Time.local.to_s, colour: EmbedColors.green)
  end
end
