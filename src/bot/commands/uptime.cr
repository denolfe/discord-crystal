struct UptimeCommand < Bot::BaseCommand
  self.name = "uptime"
  self.description = "Displays the bot's uptime"
  self.usage = "uptime"

  def self.execute(args : Array(String)?)
    uptime = Time.utc_now - START_TIME
    formatted = "#{uptime.days} days #{uptime.hours}h#{uptime.minutes}m"
    Discord::Embed.new(description: formatted, colour: EmbedColors.white)
  end
end
