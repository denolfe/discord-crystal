require "./base_command"
require "./commands/*"

class CommandHandler
  def initialize()
    puts Bot::Registry.to_s
  end

  def call(payload : Discord::Message, context : Discord::Context)
    command_name, args = parse_command(payload.content)
    return if command_name.nil?

    found_command = Bot::Registry.find command_name
    if found_command.nil?
      puts "'#{command_name}' command not found." 
      return
    end
    puts "Running '#{found_command.name}' command. Author: #{payload.author.username}. Content: #{payload.content}"
    begin
      embed = found_command.execute args
      context[Discord::Client].create_message(payload.channel_id, "", embed)
      yield
    rescue exception
      puts "Failed handling #{found_command.name} command"
    end
  end

  private def parse_command(message_content : String)
    match = /^.([\w+]+)(.*)/.match(message_content)

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
