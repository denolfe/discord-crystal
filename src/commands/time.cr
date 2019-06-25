class TimeCommand < CommandBase
  def initialize
    super "time"
  end

  def run(args : (Array(String) | Nil))
    Discord::Embed.new(description: Time.local.to_s, colour: EmbedColors.green)
  end
end
