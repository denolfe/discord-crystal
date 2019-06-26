module Bot
  # Stores the available commands.
  struct Registry
    macro finished
      # Array of available commands.  Auto registered at compile time.
      class_getter commands : Array(Bot::Command.class) = {% if Bot::Command.subclasses.size > 0 %}{{Bot::Command.subclasses}} {% else %} [] {% end %} of Bot::Command.class
    end

    # Displays the available commands.
    def self.to_s : String
      String.build do |str|
        str.puts "Registered Commands:"
        @@commands.each do |c|
          str.puts "\t#{c.name} - #{c.description}"
        end
      end
    end

    # Returns the command with the given name.
    #
    # Raises if no command has that name.
    def self.find(name : String) : Bot::Command.class
      command_class = @@commands.find { |c| c.name == name }
      raise "No command with the name '#{name}' has been registered" if command_class.nil?
      command_class
    end
  end
end
