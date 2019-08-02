class DiscordMiddleware::Prefix
  def initialize(@prefix : String | Char)
  end

  def call(payload : Discord::Message, context : Discord::Context)
    yield if payload.content.starts_with?(@prefix)
  end
end
