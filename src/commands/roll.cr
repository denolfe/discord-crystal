class RollCommand < CommandBase
  def initialize
    super "roll"
  end

  def run(args : (Array(String) | Nil))
    roll_dice = ->{ ["1", "2", "3", "4", "5", "6"].sample.to_s }
    Discord::Embed.new(description: "Rolled #{roll_dice.call} and #{roll_dice.call}", colour: EmbedColors.white)
  end
end
