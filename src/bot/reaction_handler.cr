require "./reactions/*"

class ReactionHandler
  def initialize(@client : Discord::Client)
    @reactions = [NutsReaction.new @client]
  end

  def handle_message(message : Discord::Message)
    @reactions.each do |reaction|
      reaction.react(message)
    end
  end
end
