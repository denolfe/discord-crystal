struct HelpCommand < Bot::BaseCommand
  self.name = "help"
  self.description = "Displays all commands or details about specific command"
  self.usage = "help or help <command>"

  def self.execute(args : Array(String)?)
    prefix = ENV["PREFIX"]
    if args == [""] || args.nil?
      help_block = String.build do |str|
        Bot::Registry.commands.each do |c|
          str.puts "#{prefix}#{c.name} - #{c.description}"
        end
      end
      Discord::Embed.new(title: "Available Commands", description: help_block, colour: EmbedColors.white)
    else
      found_command = Bot::Registry.find args[0]
      if found_command.nil?
        Discord::Embed.new(description: "Help for '#{args[0]}' command not found", colour: EmbedColors.red)
      else
        help_block = String.build do |str|
          str.puts "#{found_command.description}"
          str.puts "Usage: #{found_command.usage}"
        end
        Discord::Embed.new(
          title: "#{found_command.name.capitalize} Command",
          description: help_block,
          colour: EmbedColors.white
        )
      end
    end
  end
end
