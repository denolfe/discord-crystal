require "./command_base"

class ChooseCommand < CommandBase
  def initialize
    super "choose"
  end

  def run(args : Array(String)?)
    if args.nil?
      Discord::Embed.new(description: "You must provide choices", colour: EmbedColors.red)
    else
      Discord::Embed.new(description: args.sample.capitalize, colour: EmbedColors.white)
    end
  end
end