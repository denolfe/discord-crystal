require "http/client"

struct DadJoke < Bot::BaseCommand
  self.name = "dadjoke"
  self.description = "Random Dad Joke"
  self.usage = "dadjoke"

  def self.execute(args : Array(String)?)
    response = HTTP::Client.get("https://icanhazdadjoke.com/", headers: HTTP::Headers{"Accept" => "text/plain"})
    Discord::Embed.new(description: response.body, colour: EmbedColors.white)
  end
end
