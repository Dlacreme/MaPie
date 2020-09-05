require "yaml"

module Mapie::Config
  class ConfigAuthentication
    include YAML::Serializable

    @[YAML::Field(key: "roles")]
    property roles : Array(String)
  end
end
