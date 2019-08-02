module Emojis
  class_getter beers = "\u{1f37b}"
  class_getter chestnut = "\u{1f330}"
  class_getter peanuts = "\u{1f95c}"

  def self.get_custom_emoji(client : Discord::Client, message : Discord::Message, emoji_name : String)
    guild_id = message.guild_id
    return nil if guild_id.nil?
    custom_emoji = client.get_guild_emojis(guild_id).find { |e| e.name == emoji_name }
    return nil if custom_emoji.nil?
    return "#{custom_emoji.name}:#{custom_emoji.id}"
  end
end
