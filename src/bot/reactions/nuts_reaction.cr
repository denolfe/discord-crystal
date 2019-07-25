require "./autoreaction"

class NutsReaction < AutoReaction
  def react(message : Discord::Message)
    if (/[n]+[u]+[t]+[szy]+/.match(message.content.downcase))
      nut_emojis = [Emojis.chestnut, Emojis.peanuts]
      @client.create_reaction(message.channel_id, message.id, nut_emojis.sample)
    end
  end
end
