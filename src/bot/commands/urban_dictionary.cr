require "http/client"
require "uri"
require "json"

struct UrbanDictionary < Bot::BaseCommand
  self.name = "ud"
  self.description = "Urban Dictionary definition"
  self.usage = "ud <word>"

  def self.execute(args : Array(String)?)
    return if args.nil? || args.empty?
    words = args.map(&.capitalize).join(" ")
    response = HTTP::Client.get("http://api.urbandictionary.com/v0/define?term=#{URI.escape(words)}",
      headers: HTTP::Headers{"Accept" => "application/json"})
    parsed = JSON.parse(response.body)
    definition = parsed["list"][0]["definition"].to_s.tr("[]","")
    Discord::Embed.new(title: words, description: definition, footer: Discord::EmbedFooter.new("Urban Dictionary"), colour: EmbedColors.white)
  end
end
