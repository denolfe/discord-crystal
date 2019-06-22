require "./commands/*"

class CommandHandler
  def initialize(@client : Discord::Client, @prefix : String)
    @commands = [PingCommand.new,
                 TimeCommand.new]
    puts available_commands
  end

  def find_and_execute_command(message : Discord::Message)
    return unless message.content.starts_with? @prefix

    # TODO: Need more complex handling for args
    command_name = get_command_name(message.content)

    found_command = @commands.find { |c| c.name == command_name }
    if found_command
      puts "Running #{found_command.name} command"
      @client.create_message(message.channel_id, found_command.run)
    else
      puts "'#{@prefix + command_name}' command not found."
    end
  end

  def available_commands
    command_list = @commands.map { |c| "#{@prefix}#{c.name}" }
    puts "Available commands: #{command_list.join(", ")}"
  end

  private def get_command_name(message_content : String) : String
    message_content[1..message_content.size]
      .split(' ')
      .first
      .downcase
  end
end
