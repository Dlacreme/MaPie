require "yaml"

module Mapie::Config
  class Settings
    include YAML::Serializable

    @[YAML::Field(key: "secret_key")]
    getter secret_key : String
  end
end
