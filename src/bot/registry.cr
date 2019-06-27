module Bot
  # Stores the available commands.
  struct Registry
    macro finished
      # Array of available commands.  Auto registered at compile time.
      class_getter commands : Array(Bot::BaseCommand.class) = {% if Bot::BaseCommand.subclasses.size > 0 %}{{Bot::BaseCommand.subclasses}} {% else %} [] {% end %} of Bot::BaseCommand.class
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
    def self.find(name : String) : (Bot::BaseCommand.class | Nil)
      command_class = @@commands.find { |c| c.name == name }
      if command_class.nil?
        p "No command with the name '#{name}' has been registered"
        return nil
      end
      command_class
    end
  end
end
