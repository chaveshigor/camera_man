# frozen_string_literal: true

require 'camera_man/medias/subtitles/create_file'
require 'camera_man/medias/subtitles/element'
require 'camera_man/medias/subtitles/read_subtitle'
require 'camera_man/medias/subtitles/errors'

module CameraMan
  module Medias
    module Subtitles
      class Record
        attr_reader :path, :subtitles

        def initialize(path: nil, subtitles: nil)
          if !path.nil? && !correct_extension?(path)
            fail Subtitles::Errors::InvalidSubtitleExtension
          end

          @subtitles = subtitles.map { |s| Element.new(s) } if !subtitles.nil?
          @path      = create_str_file                      if !subtitles.nil?
          @path      = Types::FilePath.new(path)            if !path.nil?
          @subtitles = ReadSubtitle.new(path).call          if !path.nil?

          fail ArgumentError if @path.nil?
        end

        private

        def create_str_file = Subtitles::CreateFile.new(@subtitles).call

        def correct_extension?(path)
          extension = path.to_s.split('.').last
          extension == 'str'
        end
      end
    end
  end
end

