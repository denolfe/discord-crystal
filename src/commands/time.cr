require "./command_base"
require "../utils/embed_colors"

class TimeCommand < CommandBase
  def initialize
    super "time"
  end

  def run
    Discord::Embed.new(description: Time.local.to_s, colour: EmbedColors.green)
  end
end
