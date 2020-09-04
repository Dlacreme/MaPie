require "yaml"

module Mapie
  class Pie
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    property name : String

    @[YAML::Field(key: "description")]
    property description : String?

    @[YAML::Field(key: "version")]
    property version : Int32?

    @[YAML::Field(key: "authors")]
    property authors : Array(String)

    @[YAML::Field(key: "settings")]
    property settings : PieSettings

    def self.load_from(file_path : String)
      File.open(file_path) { |f| Pie.from_yaml(f) }
    end
  end

  class PieSettings
    include YAML::Serializable

    @[YAML::Field(key: "secret_key")]
    property secret_key : String

    @[YAML::Field(key: "database_url")]
    property database_url : String?
  end
end
