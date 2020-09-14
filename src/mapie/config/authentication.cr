require "yaml"

module Mapie::Config_
  class Authentication
    include YAML::Serializable

    @[YAML::Field(key: "roles")]
    getter roles : Array(String)
  end
end
