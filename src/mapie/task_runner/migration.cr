require "ecr"

module Mapie::TaskRunner_
  class Migration
    MIGRATION_FOLDER = "migrations"

    private property writer : Writer

    def initialize(@writer)
    end

    # Write a migration required to match @current config. If @previous is null, write the initial schema
    def create(current : Config, previous : Config?)
      @writer.create_or_clear_folder MIGRATION_FOLDER
      fd = @writer.create_and_open_file "#{MIGRATION_FOLDER}/migration_#{current.version}.pgsql"
      current.models.each { |x| write_table fd, x }
      current.models.each { |x| write_relationship fd, x, current.models }
    ensure
      fd.close if fd
    end

    private def write_table(fd : File, model : Config_::Model)
      fd << ECR.render "src/mapie/task_runner/templates/migration.ecr"
    end

    private def write_relationship(fd : File, model : Config_::Model, models : Array(Config_::Model))
      relationships = Array(Migration_::Relationship).new
      model.format.each do |k, v|
        unless v.one_to_one.nil?
          rel_model = models.find { |x| x.name == v.one_to_one.not_nil!.related_to }.not_nil!
          relationships << Migration_::Relationship.new(
            Config_::Model_::Relationship::OneToOne, model.table_name, k, rel_model.table_name, rel_model.format.first_key, nil
          )
          v.type = "#{v.type} UNIQUE" if v.type.index("UNIQUE").nil?
        end
        unless v.one_to_many.nil?
          rel_model = models.find { |x| x.name == v.one_to_many.not_nil!.related_to }.not_nil!
          relationships << Migration_::Relationship.new(
            Config_::Model_::Relationship::OneToMany, model.table_name, k, rel_model.table_name, rel_model.format.first_key, nil
          )
        end
      end
      relationships.each { |relationship| fd << ECR.render "src/mapie/task_runner/templates/relationship.ecr" }
    end

    private def open_migration_file(current_version : String) : File
      @writer.create_folder_if_required MIGRATION_FOLDER
      @writer.create_and_open_file "#{MIGRATION_FOLDER}/migration_#{current.version}.pgsql"
    end
  end

  module Migration_
    class Relationship
      getter type : Config_::Model_::Relationship
      getter table_name : String
      getter foreign_key : String
      getter reference_to : String
      getter reference_key : String
      getter rules : String

      def initialize(
        @type : Config_::Model_::Relationship,
        @table_name : String,
        @foreign_key : String,
        @reference_to : String,
        @reference_key : String,
        rules_as_nil : String?
      )
        @rules = rules_as_nil.nil? ? "" : rules_as_nil
      end
    end
  end
end
