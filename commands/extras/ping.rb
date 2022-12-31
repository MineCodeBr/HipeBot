class Command
  def initialize (bot)
    bot.register_application_command(:ping, 'ping command')
  end
  def run (bot, database_users)
    bot.application_command(:ping) do |event|
      message = event.respond(content: "Pong") 
    end
  end
end
