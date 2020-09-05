require "yaml"

module Mapie::Model
  class ConfigModelFormat
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    getter name : String

    @[YAML::Field(key: "table_name")]
    getter table_name : String

    # @[YAML::Field(key: "seed")]
    # getter name : String

    # @[YAML::Field(key: "name")]
    # getter name : String

    # @[YAML::Field(key: "name")]
    # getter name : String

  end
end
