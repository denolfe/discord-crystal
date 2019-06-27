struct RollCommand < Bot::BaseCommand
  self.name = "roll"
  self.description = "Roll a 6-sided die"
  self.usage = "roll"

  def self.execute(args : Array(String)?)
    roll_dice = ->{ ["1", "2", "3", "4", "5", "6"].sample.to_s }
    Discord::Embed.new(description: "Rolled #{roll_dice.call} and #{roll_dice.call}", colour: EmbedColors.white)
  end
end
