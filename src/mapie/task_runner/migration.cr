module Mapie::Task
  class Migration
    private property writer : Writer

    def initialize(@writer)
    end

    # Create migration for @models
    def create(models : Array(Config::Model))
    end
  end
end
