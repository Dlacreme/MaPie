module Mapie::Task
  class Migration
    MIGRATION_FOLDER = "migrations"

    private property writer : Writer

    def initialize(@writer)
    end

    # Create migration for @models
    def create(models : Array(Config::Model))
      @writer.create_or_clear_folder MIGRATION_FOLDER

      models.each { |x| write_migration(x) }
    end

    def write_migration(model : Config::Model)
      fd = @writer.create_and_open_file self.get_migration_filename(model.table_name)
    end

    def get_migration_filename(table_name : String) : String
      return "#{MIGRATION_FOLDER}/#{table_name}.pgsql"
    end
  end
end
