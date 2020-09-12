require "yaml"

module Mapie::Config
  class Database
    include YAML::Serializable

    @[YAML::Field(key: "url")]
    getter url : String

    @[YAML::Field(key: "constraints")]
    getter constraints : Array(String)
  end
end
