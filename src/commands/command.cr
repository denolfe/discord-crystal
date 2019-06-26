require "../utils/embed_colors"

module Bot
  abstract struct Command
    # Name of the command.
    class_property name : String = ""

    # What the command does.
    class_property description : String = ""

    # Usage
    class_property usage : String = ""

    # abstract def self.execute(args : Array(String)?) : Discord::Embed

    macro inherited
    macro finished
      \{% begin %}
        \{% raise "#{@type.name} must implement a `self.execute` method." unless @type.class.methods.any? { |m| m.name.stringify == "execute"} %}
        \{% for method in @type.class.methods %}
          \{% if method.name.stringify == "execute" %}

            # Displays more detailed information about `self`.
            def self.to_s : String
              String.build do |str|
                str.puts "Command"
                str.puts "\t#{@@name} - #{@@description}"
              end
            end

          \{% end %}
        \{% end %}
      \{% end %}
    end
  end
  end
end
