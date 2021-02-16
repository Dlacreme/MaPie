module Mapie
  class TaskRunner
    ROOT_FOLDER = ".mapie"

    getter config : Config

    private property writer : TaskRunner_::Writer
    private property migration : TaskRunner_::Migration

    def initialize(@config : Config)
      @writer = TaskRunner_::Writer.new config.output
      @migration = TaskRunner_::Migration.new @writer
      self.setup
    end

    # Create .mapie folder if required
    def setup
      @writer.setup_root_folder
    end

    # Go through models and write each migrations
    def create_migrations
      self.migration.create self.config, nil
    end
  end
end
