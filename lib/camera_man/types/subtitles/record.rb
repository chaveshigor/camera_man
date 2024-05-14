# frozen_string_literal: true

module CameraMan
  module Types
    module Subtitles
      require 'camera_man/types/subtitles/errors'
      require 'camera_man/types/subtitles/element'

      class Record
        attr_reader :data

        def initialize(subtitle_object)
          @subtitle_object = subtitle_object
  
          valid_subtitle?
        end
  
        private
  
        def valid_subtitle?
          @subtitle_object.is_a?(Array) or raise Errors::Invalid.new(@subtitle_object)
  
          @data = @subtitle_object.map { |element| Element.new(element) }
        end
      end
    end
  end
end

