class CheersReaction < AutoReaction
  def react(message : Discord::Message)
    if (/cheers/.match(message.content.downcase))
      @client.create_reaction(message.channel_id, message.id, Emojis.beers)
    end
  end
end
