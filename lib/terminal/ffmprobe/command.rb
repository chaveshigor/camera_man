# frozen_string_literal: true

module Terminal
  module FFMProbe
    class Command
      def initialize(media:)
        @media = media
      end

      def create
        "ffprobe -v quiet -print_format json -show_format -show_streams #{@media.file_path}"
      end
    end
  end
end

