require "dotenv"

struct ConfigLoader
  def self.load
    Dotenv.load
    ENV["PREFIX"] ||= "!"
    raise "No Discord token to load" if ENV["DISCORD_TOKEN"].nil?
  end
end
