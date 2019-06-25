class EightBallCommand < CommandBase
  def initialize
    super "8ball"
  end

  def run
    responses = [
      # Affirmative
      EightBallResponse.new("It is certain", EmbedColors.green),
      EightBallResponse.new("It is decidedly so", EmbedColors.green),
      EightBallResponse.new("Without a doubt", EmbedColors.green),
      EightBallResponse.new("Yes definitely", EmbedColors.green),
      EightBallResponse.new("You may rely on it", EmbedColors.green),
      EightBallResponse.new("As I see it, yes", EmbedColors.green),
      EightBallResponse.new("Most likely", EmbedColors.green),
      EightBallResponse.new("Outlook good", EmbedColors.green),
      EightBallResponse.new("Yes", EmbedColors.green),
      EightBallResponse.new("Signs point to yes", EmbedColors.green),

      # Non-commital
      EightBallResponse.new("Reply hazy, try again", EmbedColors.white),
      EightBallResponse.new("Ask again later", EmbedColors.white),
      EightBallResponse.new("Better not tell you now", EmbedColors.white),
      EightBallResponse.new("Cannot predict now", EmbedColors.white),
      EightBallResponse.new("Concentrate and ask again", EmbedColors.white),

      # Negative
      EightBallResponse.new("Don't count on it", EmbedColors.red),
      EightBallResponse.new("My reply is no", EmbedColors.red),
      EightBallResponse.new("My sources say no", EmbedColors.red),
      EightBallResponse.new("Outlook not so good", EmbedColors.red),
      EightBallResponse.new("Very doubtful", EmbedColors.red),
    ]

    response = responses.sample

    Discord::Embed.new(description: response.text, colour: response.embed_color)
  end
end

class EightBallResponse
  property text : String
  property embed_color : UInt32

  def initialize(@text : String, @embed_color : UInt32)
  end
end