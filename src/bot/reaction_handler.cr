require "./reactions/autoreaction"
require "./reactions/*"
require "./emojis"

class ReactionHandler
  def call(payload, context)
    reactions = [
      NutsReaction.new(context[Discord::Client]),
      CheersReaction.new(context[Discord::Client]),
    ]
    reactions.each do |reaction|
      reaction.react(payload)
    end
    yield
  end
end
