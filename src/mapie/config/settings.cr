require "yaml"

module Mapie::Config
  class ConfigSettings
    include YAML::Serializable

    @[YAML::Field(key: "secret_key")]
    property secret_key : String

    @[YAML::Field(key: "database_url")]
    property database_url : String?
  end
end
