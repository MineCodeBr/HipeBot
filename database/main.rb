require "colorize"
require "mongo"
require "yaml"

class DataBase
  def initialize (database, model)
    config = YAML.load_file("config.yaml")

    @@client = Mongo::Client.new("#{config["mongo"]}/#{database}")
    puts "#{'[DATABASE]'.colorize(:green)} Connect"
    @@model = @@client[model]
  end

  def set (data)
    @@model.insert_one(data)
  end

  def get (id)
    @@model.find({ _id: "#{id.to_s}" }).first
  end


end
