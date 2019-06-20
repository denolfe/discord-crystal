abstract class CommandBase
  getter name : String

  def initialize(@name : String)
  end

  abstract def run

end
