# frozen_string_literal: true

require 'terminal/runner'
require 'terminal/ffmprobe/command'
require 'terminal/ffmprobe/parser'

module CameraMan
  module Medias
    # This class is responsible for store all the
    # video states and to make all the needed processes
    class Video
      attr_reader :file_path, :metadata, :resolution, 
                  :aspect_ratio, :starts_at, :ends_at

      def initialize(
        file_path:,
        resolution: nil,
        aspect_ratio: nil,
        starts_at: nil,
        ends_at: nil
      )
        @file_path = Utils::FilePath.new(file_path)

        self.resolution   = resolution   if !resolution.nil?
        self.aspect_ratio = aspect_ratio if !aspect_ratio.nil?
        self.starts_at    = starts_at    if !starts_at.nil?
        self.ends_at      = ends_at      if !ends_at.nil?
      end

      def resolution=(new_resolution)
        @resolution = Resolution.new(new_resolution).value
      end

      def aspect_ratio=(aspect_ratio)
        @aspect_ratio = AspectRatio.new(aspect_ratio).value
      end

      def starts_at=(time_in_seconds)
        @starts_at = VideoTime.new(time_in_seconds).value
      end

      def ends_at=(time_in_seconds)
        @ends_at = VideoTime.new(time_in_seconds).value
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

      class Resolution
        def initialize(resolution)
          resolution => [Integer, Integer]
          @resolution = resolution
        rescue NoMatchingPatternError
          raise Errors::InvalidResolution
        end

        def value = @resolution
      end

      class AspectRatio
        def initialize(aspect_ratio)
          aspect_ratio => [Integer, Integer]
          @aspect_ratio = aspect_ratio
        rescue NoMatchingPatternError
          raise Errors::InvalidAspectRatio
        end

        def value = @aspect_ratio
      end

      class VideoTime
        def initialize(time_in_seconds)
          time_in_seconds => Integer
          @time_in_seconds = time_in_seconds
        rescue NoMatchingPatternError
          raise Errors::InvalidTime
        end

        def value = @time_in_seconds
      end
    end
  end
end
