struct ThisOrThatCommand < Bot::Command
  self.name = "choose"
  self.description = "Chooses randomly between provided choices"
  self.usage = "!choose this that"

  def self.execute(args : Array(String)?)
    if args.nil?
      Discord::Embed.new(description: "You must provide choices", colour: EmbedColors.red)
    else
      Discord::Embed.new(description: args.sample.capitalize, colour: EmbedColors.white)
    end
  end
end