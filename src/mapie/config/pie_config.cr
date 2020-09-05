require "yaml"

module Mapie
  include Config

  class PieConfig
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    getter name : String

    @[YAML::Field(key: "description")]
    getter description : String?

    @[YAML::Field(key: "version")]
    getter version : String?

    @[YAML::Field(key: "authors")]
    getter authors : Array(String)

    @[YAML::Field(key: "settings")]
    getter settings : ConfigSettings

    @[YAML::Field(key: "authentication")]
    getter authentication : ConfigAuthentication

    @[YAML::Field(key: "models")]
    getter models : Array(ConfigModel)

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
  end
end
