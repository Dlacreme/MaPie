require "yaml"

module Mapie::Config
  class ModelFormat
    getter field_name : String
    getter type : String
    getter primary_key : Bool

    # getter foreign_key? : Bool
    # getter foreign_key_params : String

    def initialize(@field_name, @type, @primary_key)
    end
  end

  class ModelYAML
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    getter name : String

    @[YAML::Field(key: "table_name")]
    getter table_name : String

    @[YAML::Field(key: "format")]
    getter raw_format : Hash(String, String)

    # @[YAML::Field(key: "seed")]
    # getter name : String

    # @[YAML::Field(key: "name")]
    # getter name : String

    # @[YAML::Field(key: "name")]
    # getter name : String

    # def initialize(*, @name, @table_name, @raw_format)
    # self.parse_raw_format
    # @parsed_format = self.parse_raw_format
    # puts @parsed_format
    #  puts "TYPEOF : >> "
    #  puts @parsed_format.typeof
    # end

    # Simply print the model
    def pretty_print
      puts sprintf "[%s] as %s:", self.table_name, self.name
      # self.raw_format.each { |k, x| puts sprintf "  - %s (%s)", k, x }
    end

    # Parse @raw_format to build @format
    def parse_raw_format(raw_format : String) : Array(Config::ModelFormat)
      res = [] of ModelFormat
      @raw_format.each do |x|
        x
      end
      res
    end
  end

  class Model < ModelYAML
    getter format

    def initialize
      puts "HELLO WORLD !!"
    end

    def parse_idioms
    end
  end
end
