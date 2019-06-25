class UptimeCommand < CommandBase
  def initialize
    super "uptime"
    @start_time = Time.utc_now
  end

  def run(args : Array(String)?)
    uptime = Time.utc_now - @start_time
    formatted = "#{uptime.days} days #{uptime.hours}h#{uptime.minutes}m"
    Discord::Embed.new(description: formatted, colour: EmbedColors.white)
  end
end