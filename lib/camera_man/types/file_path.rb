# frozen_string_literal: true

module CameraMan
  module Types
    class FilePath
      def initialize(file_path)
        @file_path = file_path

        valid_type?      or raise Errors::InvalidType
        valid_file_path? or raise Errors::InvalidFilePath
        file_exists?     or raise Errors::FileNotFound.new(@file_path)
      end
  
      def to_s = @file_path
  
      private

      def valid_type?      = @file_path.class == String
      def valid_file_path? = @file_path.match?(FILE_PATH_REGEX)
      def file_exists?     = ::File.exists?(@file_path)
  
      FILE_PATH_REGEX = /^[A-Za-z]{0,1}[:]{0,1}(\/?[\w\-.]+\/)*([\w\-.]+\/)*([\w\-.]+)\.(\w+)$/
    end
  end
end
