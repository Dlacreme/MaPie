require "yaml"

module Mapie::Model
  class ConfigModelFormat
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    property name : String

    @[YAML::Field(key: "table_name")]
    property table_name : String

    # @[YAML::Field(key: "seed")]
    # property name : String

    # @[YAML::Field(key: "name")]
    # property name : String

    # @[YAML::Field(key: "name")]
    # property name : String

  end
end
