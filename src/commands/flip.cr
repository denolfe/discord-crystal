class FlipCommand < CommandBase
  def initialize
    super "flip"
  end

  def run(args : Array(String)?)
    if args.nil?
      return Discord::Embed.new(description: "heads or tails must be provided", colour: EmbedColors.red)
    end
    responses = ["heads", "tails"]
    choice = args.first.downcase
    if !responses.includes? choice 
      return Discord::Embed.new(description: "Heads or Tails must be provided", colour: EmbedColors.red)
    end

    result = responses.sample
    color = choice == result ? EmbedColors.green : EmbedColors.red

    Discord::Embed.new(description: result.capitalize, colour: color)
  end
end
