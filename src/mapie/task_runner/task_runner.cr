module Mapie
  class TaskRunner
    ROOT_FOLDER = ".mapie"

    getter config : PieConfig

    private property writer : Task::Writer
    private property migration : Task::Migration

    def initialize(@config : PieConfig)
      @writer = Task::Writer.new ROOT_FOLDER
      @migration = Task::Migration.new @writer
      self.setup
    end

    # Create .mapie folder if required
    def setup
      @writer.setup_root_folder
    end

    # Go through models and write each migrations
    def create_migrations
      self.migration.create self.config.models
    end
  end
end
