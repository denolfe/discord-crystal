require "./command_base"

class PingCommand < CommandBase
  def initialize
    super "ping"
  end

  def run
    "Pong!"
  end
end
