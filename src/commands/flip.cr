class FlipCommand < CommandBase
  def initialize
    super "flip"
  end

  def run(args : (Array(String) | Nil))
    return if args.nil?
    choice = args.first
    responses = ["heads", "tails"]
    return unless responses.includes? choice

    result = responses.sample
    color = choice == result ? EmbedColors.green : EmbedColors.red

    Discord::Embed.new(description: result, colour: color)
  end
end
