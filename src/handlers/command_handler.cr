require "../commands/*"

class CommandHandler
  def initialize(@client : Discord::Client, @prefix : String)
    puts Bot::Registry.to_s
  end

  def find_and_execute_command(message : Discord::Message)
    return unless message.content.starts_with? @prefix

    command_name, args = parse_command(message.content)
    return if command_name.nil?

    found_command = Bot::Registry.find command_name
    if found_command
      puts "Running '#{found_command.name}' command"
      begin
        embed = found_command.execute args
        @client.create_message(message.channel_id, "", embed)
      rescue exception
        puts "Failed handling #{found_command.name} command"
      end
    else
      puts "'#{@prefix + command_name}' command not found."
    end
  end

  private def parse_command(message_content : String)
    match = /^\.([\w+]+)(.*)/.match(message_content)

    if match
      command_name = match[1].downcase
      if match[2]?
        args = match[2].strip.downcase.split(' ')
      else
        args = nil
      end
      return command_name, args
    else
      return nil, nil
    end
  end
end
