require "yaml"

module Mapie::Config_
  class Model
    include YAML::Serializable

    @[YAML::Field(key: "name")]
    getter name : String

    @[YAML::Field(key: "table_name")]
    getter table_name : String

    @[YAML::Field(key: "endpoint")]
    getter endpoint : String?

    @[YAML::Field(key: "format")]
    getter format : Hash(String, Model_::Format)

    @[YAML::Field(key: "constraints")]
    getter constraints : Array(String)?

    # Simply print the model
    def pretty_print
      puts sprintf "[%s] as %s:", self.table_name, self.name
      format.each { |k, x| puts sprintf "  - %s (%s)", k, x.type }
    end
  end

  module Model_
    enum Relationship
      OneToOne
      OneToMany
      ManyToMany
    end

    class Format
      include YAML::Serializable

      @[YAML::Field(key: "type")]
      property type : String

      @[YAML::Field(key: "usage")]
      getter usage : String?

      @[YAML::Field(key: "one_to_one")]
      getter one_to_one : OneToXRelationship?

      @[YAML::Field(key: "one_to_many")]
      getter one_to_many : OneToXRelationship?

      # Generate method to check if the field has any usage
      # Methods generated: with_authentication? with_solf_delete?
      {% for usage in %w(authentication soft_delete) %}
        def with_{{usage.id}}? : Bool
          !self.usage.nil? && self.usage == usage.id
        end
      {% end %}
    end

    class OneToXRelationship
      include YAML::Serializable

      @[YAML::Field(key: "related_to")]
      getter related_to : String

      @[YAML::Field(key: "related_name")]
      getter related_name : String

      @[YAML::Field(key: "rules")]
      getter rules : String?
    end

    class ManyToManyRelationship
    end
  end
end
