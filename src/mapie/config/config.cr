require "yaml"

module Mapie
  class Config
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    getter name : String

    @[YAML::Field(key: "description")]
    getter description : String = ""

    @[YAML::Field(key: "version")]
    getter version : String = "0.1.0"

    @[YAML::Field(key: "output")]
    getter output : String = ".mapie"

    @[YAML::Field(key: "authors")]
    getter authors : Array(String)

    @[YAML::Field(key: "settings")]
    getter settings : Config_::Settings

    @[YAML::Field(key: "database")]
    getter database : Config_::Database

    @[YAML::Field(key: "authentication")]
    getter authentication : Config_::Authentication

    @[YAML::Field(key: "models")]
    getter models : Array(Config_::Model)

    # Build a Config instance using the content of @file_path
    def self.load_from(file_path : String)
      File.open(file_path) { |f| Config.from_yaml(f) }
    end

    # Simply print the loaded config
    def pretty_print
      puts sprintf "%s v%s\n(%s)\n\n", self.name, self.version, self.description
      self.models.each { |x| x.pretty_print }
      puts "\n"
    end

    # Parse all Mapie idioms to build usable set of data
    def interpret_idioms
      # Nothing yet
    end
  end
end
