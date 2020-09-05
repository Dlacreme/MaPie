module Mapie
  class Runner
    getter config : PieConfig

    def initialize(@config : PieConfig)
    end

    # Go through models and write each migrations
    def create_migrations
    end
  end
end
