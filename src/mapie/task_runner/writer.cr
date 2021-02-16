require "file_utils"

module Mapie::TaskRunner_
  class Writer
    getter root_folder_pathname : String

    def initialize(@root_folder_pathname)
    end

    def setup_root_folder
      self.create_folder_if_required ""
    end

    # Create a folder @folder_name. Does nothing in case the folder is already existing
    def create_folder_if_required(folder_pathname : String)
      folder_full_pathname = self.format_pathname folder_pathname
      begin
        Dir.mkdir folder_full_pathname
        puts "#{folder_full_pathname} created."
      rescue
        puts "#{folder_full_pathname} is already existing."
      end
    end

    # Create a folder @folder_name. Remove the folder beforehand if it exists
    def create_or_clear_folder(folder_name : String)
      folder_full_pathname = self.format_pathname folder_name
      was_folder_existing = self.remove_folder folder_name
      Dir.mkdir folder_full_pathname
      puts was_folder_existing ? "Folder #{folder_full_pathname} has been created." : "Folder #{folder_full_pathname} has been cleared"
    end

    # Remove the folder and return true if the folder was existing
    def remove_folder(folder_name) : Bool
      folder_full_pathname = self.format_pathname folder_name
      FileUtils.rm_r folder_full_pathname
      return true
    rescue ex
      puts ex
      return false
    end

    # Create a new file and return the File instance of said file
    def create_and_open_file(filename : String) : File
      File.new self.format_pathname(filename), "w+"
    end

    # Concat @path with our root folder
    private def format_pathname(path : String)
      "#{@root_folder_pathname}/#{path}"
    end
  end
end
