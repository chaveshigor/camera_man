# frozen_string_literal: true

module CameraMan
  module Medias
    module Subtitles
      class ReadSubtitle
        def initialize(path)
          @path = path
          @subtitles = []
        end

        def call
          current_subtitle = {}
          file_lines.each do |line|
            if timestamp_line?(line)
              starts_at = timestamp_to_seconds(line.split('-->')[0].strip)
              ends_at   = timestamp_to_seconds(line.split('-->')[1].strip)

              current_subtitle[:starts_at] = starts_at
              current_subtitle[:ends_at]   = ends_at
            elsif index_line?(line)
              current_subtitle[:index] = line.to_i
            else
              current_subtitle[:sentence] = line
            end

            if current_subtitle.keys.sort == [:ends_at, :index, :sentence, :starts_at]
              @subtitles << current_subtitle
              current_subtitle = {}
            end
          end

          @subtitles = @subtitles.sort_by { |e| e[:index] }
          @subtitles.each { |e| e.delete(:index) }

          @subtitles.map { |e| Subtitles::Element.new(e) }
        end

        private

        def timestamp_to_seconds(timestamp)
          time = DateTime.strptime(timestamp, '%H:%M:%S,%L')

          time.hour * 3600 + time.minute * 60 + time.second + time.second_fraction.to_f
        end

        def file_lines
          file = ::File.new(@path, 'r')
          lines = file.readlines
                      .map    { |line| line.gsub("\n", '').strip }
                      .reject { |line| line.nil? || line.strip.empty? }
          file.close

          lines
        end

        def timestamp_line?(line)
          line.match?(/\d{2}:\d{2}:\d{2}[,]{0,1}\d{0,3} --> \d{2}:\d{2}:\d{2}[,]{0,1}\d{0,3}/) 
        end

        def index_line?(line) = line.match?(/^\d+$/)
      end
    end
  end
end

