require "./commands/*"

class CommandHandler
  getter commands

  def initialize(client : Discord::Client, prefix : String)
    @client = client
    @prefix = prefix
    @commands = Hash(String, CommandBase).new
    command_list = [PingCommand.new]

    command_list.each do |command|
      @commands[command.name] = command
      puts "[Command Registered] #{command.name}"
    end
  end

  def find_and_execute_command(message)
    return unless message.content.starts_with? @prefix

    # TODO: Need more complex handling for args
    command_name = message.content[1..message.content.size]
      .split(' ')[0]
      .downcase # strip off prefix

    found_command = @commands.fetch(command_name) { nil }
    if found_command
      puts "Running #{found_command.name} command"
      @client.create_message(message.channel_id, found_command.run)
    else
      puts "'#{@prefix + command_name}' command not found."
    end
  end
end
