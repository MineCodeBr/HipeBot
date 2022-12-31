require 'discordrb'
require 'yaml'
require './database/main.rb'

config = YAML.load_file("config.yaml")

bot = Discordrb::Bot.new token: config["token"]
puts "#{'[BOT]'.colorize(:blue)} Starting..."

database_users = DataBase.new("test", "users")

puts database_users.get(123456789)

commands = 0

Dir[File.expand_path('commands/**/*.rb', File.dirname(__FILE__))].each do |file|
  require file

  begin
    command = Command.new bot
    command.run(bot, database_users)
  rescue => error
    puts "#{'[COMMANDS]'.colorize(:red)}#{'[ERROR]'.colorize(:yellow)} #{error}"
  ensure
    commands += 1
  end

end

puts "#{'[COMMANDS]'.colorize(:green)} Load(#{commands})"
puts "#{'[BOT]'.colorize(:green)} Online"

bot.run
