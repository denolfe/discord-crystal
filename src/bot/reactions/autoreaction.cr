abstract class AutoReaction
  def initialize(@client : Discord::Client)
  end

  abstract def react(message : Discord::Message)
end
