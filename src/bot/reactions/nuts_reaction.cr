require "./autoreaction"

class NutsReaction < AutoReaction
  def react(message : Discord::Message)
    if (/[n]+[u]+[t]+[szy]+/.match(message.content))
      nut_emojis = ["\u{1f330}", "\u{1f95c}"]
      @client.create_reaction(message.channel_id, message.id, nut_emojis.sample)
    end
  end
end
