require "yaml"

module Mapie::Config
  class ConfigAuthentication
    include YAML::Serializable

    @[YAML::Field(key: "roles")]
    getter roles : Array(String)
  end
end
