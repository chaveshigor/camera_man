# frozen_string_literal: true

require 'terminal/runner'
require 'terminal/ffmprobe/command'
require 'terminal/ffmprobe/parser'

module CameraMan
  module Medias
    # This class is responsible for store all the
    # video states and to make all the needed processes
    class Video
      attr_reader :file_path, :metadata

      def initialize(file_path:)
        @file_path = Utils::FilePath.new(file_path)
      end

      def set_resolution=(new_resolution)
        new_resolution => String
      end

      def metadata
        @metadata ||= begin
          command = ::Terminal::FFMProbe::Command.new(media: self).create
          parser  = ::Terminal::FFMProbe::Parser
          result  = ::Terminal::Runner.call(command: command, output_parser: parser)

          Metadata.new(result)
        end
      end

      private

      # This class is responsible for store
      # the video metadata
      class Metadata
        attr_reader :duration, :start_time, :end_time, :format_name,
                    :format_long_name, :bit_rate, :size, :encoder,
                    :width, :height, :language, :title, :resolution

        def initialize(ffmprobe_output)
          # Time metadata
          @duration         = ffmprobe_output[:format][:duration].to_f
          @start_time       = ffmprobe_output[:format][:start_time].to_f
          @end_time         = @start_time + @duration

          # File metadata
          @format_name      = ffmprobe_output[:format][:format_name]
          @format_long_name = ffmprobe_output[:format][:format_long_name]
          @bit_rate         = ffmprobe_output[:format][:bit_rate].to_i
          @size             = ffmprobe_output[:format][:size].to_i
          @encoder          = ffmprobe_output[:format][:tags][:encoder]

          # Video content metadata
          @width            = ffmprobe_output[:streams].first[:width]
          @height           = ffmprobe_output[:streams].first[:height]
          @resolution       = [@width, @height]
          @language         = ffmprobe_output[:streams].first[:tags][:language]
          @title            = ffmprobe_output[:streams].first[:tags][:title]
        end
      end
    end
  end
end
