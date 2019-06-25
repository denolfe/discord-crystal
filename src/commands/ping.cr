class PingCommand < CommandBase
  def initialize
    super "ping"
  end

  def run
    Discord::Embed.new(description: "Pong!", colour: EmbedColors.green)
  end
end
