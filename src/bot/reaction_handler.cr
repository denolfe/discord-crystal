require "./reactions/autoreaction"
require "./reactions/*"
require "./emojis"

class ReactionHandler
  def initialize(@client : Discord::Client)
    @reactions = [
      NutsReaction.new(@client),
      CheersReaction.new(@client),
    ]
  end

  def handle_message(message : Discord::Message)
    @reactions.each do |reaction|
      reaction.react(message)
    end
  end
end
