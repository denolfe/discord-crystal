require "../utils/embed_colors"

abstract class CommandBase
  getter name : String

  def initialize(@name : String)
  end

  abstract def run(args : (Array(String) | Nil)) : Discord::Embed
end
