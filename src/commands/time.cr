require "./command_base"

class TimeCommand < CommandBase
  def initialize
    super "time"
  end

  def run
    Time.local.to_s
  end
end
