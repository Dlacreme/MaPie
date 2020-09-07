module Mapie
  class TaskRunner
    getter config : PieConfig

    private property writer : Task::Writer
    private property migration : Task::Migration

    def initialize(@config : PieConfig)
      @writer = Task::Writer.new "./.mapie"
      @migration = Task::Migration.new @writer
    end

    # Create .mapie folder if required
    def setup
      writer.setup
    end

    # Go through models and write each migrations
    def create_migrations
      self.migration.create self.config.models
    end
  end
end
