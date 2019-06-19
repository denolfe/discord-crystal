abstract class CommandBase
  getter name : String

  def initialize(name : String)
    @name = name
  end

  abstract def run

end
