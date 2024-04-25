# frozen_string_literal: true

module CameraMan
  module Errors
    class CameraManError < StandardError; end
  
    class InvalidFilePath < CameraManError
      def message = 'The path is not valid'
    end
  
    class FileNotFound < CameraManError
      def initialize(file_path) = @file_path = file_path
      def message = "The file [#{@file_path}] was not found"
    end

    class InvalidType < CameraManError
      def message = 'The filepath needs to be a String'
    end
  end
end
