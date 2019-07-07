struct TimeCommand < Bot::BaseCommand
  self.name = "time"
  self.description = "Displays the bot's time"
  self.usage = "time"

  def self.execute(args : Array(String)?)
    Discord::Embed.new(description: Time.local.to_s, colour: EmbedColors.white)
  end
end
