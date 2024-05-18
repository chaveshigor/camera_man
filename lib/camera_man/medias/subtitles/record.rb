# frozen_string_literal: true

require 'camera_man/medias/subtitles/create_file'
require 'camera_man/medias/subtitles/element'

module CameraMan
  module Medias
    module Subtitles
      class Record
        attr_reader :path

        def initialize(path: nil, subtitles: nil)
          @subtitles = subtitles
          @path      = Types::FilePath.new(path) if !path.nil?
          @path      = create_str_file           if !subtitles.nil?

          fail ArgumentError if @path.nil?
        end

        private

        def create_str_file = Subtitles::CreateFile.new(@subtitles).call

        def correct_extension?
          extension = @path.to_s.split('.').last
          extension == 'str' or raise InvalidSubtitleExtension
        end
      end
    end
  end
end

