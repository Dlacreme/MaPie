require "yaml"

module Mapie::Config
  class ConfigSettings
    include YAML::Serializable

    @[YAML::Field(key: "secret_key")]
    getter secret_key : String

    @[YAML::Field(key: "database_url")]
    getter database_url : String?
  end
end
