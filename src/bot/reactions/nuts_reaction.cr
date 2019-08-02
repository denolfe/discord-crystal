require "./autoreaction"

class NutsReaction < AutoReaction
  def react(message : Discord::Message)
    if (/[n]+[u]+[t]+[szy]+/.match(message.content.downcase))
      nut_emoji = [Emojis.chestnut, Emojis.peanuts].sample
      custom_emoji = Emojis.get_custom_emoji(@client, message, "nuts")
      @client.create_reaction(message.channel_id, message.id, custom_emoji || nut_emoji)
    end
  end
end
