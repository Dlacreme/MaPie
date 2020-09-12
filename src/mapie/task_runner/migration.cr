require "ecr"

module Mapie::Task
  class Migration
    MIGRATION_FOLDER = "migrations"

    private property writer : Writer

    def initialize(@writer)
    end

    # Write a migration required to match @current config. If @previous is null, write the initial schema
    def create(current : PieConfig, previous : PieConfig?)
      @writer.create_or_clear_folder MIGRATION_FOLDER
      fd = @writer.create_and_open_file "#{MIGRATION_FOLDER}/migration_#{current.version}.pgsql"
      current.models.each { |x| write_migration fd, x }
    ensure
      fd.close if fd
    end

    def write_migration(fd : File, model : Config::Model)
      fd << ECR.render "src/mapie/task_runner/templates/migration.ecr"
    end

    def open_migration_file(current_version : String) : File
      @writer.create_folder_if_required MIGRATION_FOLDER
      @writer.create_and_open_file "#{MIGRATION_FOLDER}/migration_#{current.version}.pgsql"
    end
  end
end
