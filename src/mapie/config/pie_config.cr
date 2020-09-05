require "yaml"

module Mapie
  include Config

  class PieConfig
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    property name : String

    @[YAML::Field(key: "description")]
    property description : String?

    @[YAML::Field(key: "version")]
    property version : String?

    @[YAML::Field(key: "authors")]
    property authors : Array(String)

    @[YAML::Field(key: "settings")]
    property settings : ConfigSettings

    @[YAML::Field(key: "authentication")]
    property authentication : ConfigAuthentication

    @[YAML::Field(key: "models")]
    property models : Array(ConfigModel)

    # Build a Config instance using the content of @file_path
    def self.load_from(file_path : String)
      File.open(file_path) { |f| PieConfig.from_yaml(f) }
    end

    def pretty_print
      puts sprintf "%s v%s\n(%s)\n\n", self.name, self.version, self.description
      self.models.each { |x| x.pretty_print }
      puts "\n"
    end

    # Parse all Mapie idioms to build usable set of data
    def interpret_idioms
    end

    # Go through models and write each migrations
    def create_migrations
    end
  end
end
