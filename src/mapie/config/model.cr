require "yaml"

module Mapie::Config
  class Model
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    getter name : String

    @[YAML::Field(key: "table_name")]
    getter table_name : String

    @[YAML::Field(key: "format")]
    getter format : Hash(String, String)

    # @[YAML::Field(key: "seed")]
    # getter name : String

    # @[YAML::Field(key: "name")]
    # getter name : String

    # @[YAML::Field(key: "name")]
    # getter name : String

    def pretty_print
      puts sprintf "[%s] as %s:", self.table_name, self.name
      self.format.each { |k, x| puts sprintf "  - %s (%s)", k, x }
    end
  end
end
