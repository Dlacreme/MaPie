require "yaml"

module Mapie::Config
  class ModelFormat
    include YAML::Serializable

    @[YAML::Field(key: "type")]
    getter type : String

    @[YAML::Field(key: "primary_key")]
    getter primary_key : Bool = false

    # getter foreign_key? : Bool
    # getter foreign_key_params : String
  end

  class Model
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    getter name : String

    @[YAML::Field(key: "table_name")]
    getter table_name : String

    @[YAML::Field(key: "format")]
    getter format : Hash(String, ModelFormat)

    @[YAML::Field(key: "endpoint")]
    getter endpoint : String?

    # Simply print the model
    def pretty_print
      puts sprintf "[%s] as %s:", self.table_name, self.name
      format.each { |k, x| puts sprintf "  - %s (%s)", k, x.type }
    end
  end
end
