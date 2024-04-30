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

    class InvalidResolution < CameraManError
      def message = 'The resolution is invalid. It must be an Array like [1366, 768]'
    end
    
    class InvalidAspectRatio < CameraManError
      def message = 'The aspect ratio is invalid. It must be an Array like [16, 9]'
    end

    class InvalidTime < CameraManError
      def message = 'The time must be an amount of seconds (integer)'
    end
  end
end
