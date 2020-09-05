require "yaml"

module Mapie::Config
  class ConfigModel
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    property name : String

    @[YAML::Field(key: "table_name")]
    property table_name : String

    @[YAML::Field(key: "format")]
    property format : Hash(String, String)

    # @[YAML::Field(key: "seed")]
    # property name : String

    # @[YAML::Field(key: "name")]
    # property name : String

    # @[YAML::Field(key: "name")]
    # property name : String

    def pretty_print
      puts sprintf "[%s] as %s:", self.table_name, self.name
      self.format.each { |k, x| puts sprintf "  - %s (%s)", k, x }
    end
  end
end
