class PingCommand < CommandBase
  def initialize
    super "ping"
  end

  def run(args : (Array(String) | Nil))
    Discord::Embed.new(description: "Pong!", colour: EmbedColors.green)
  end
end
