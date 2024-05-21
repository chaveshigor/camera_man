# frozen_string_literal: true

# The output needs to be a file with this content:

# 1
# 00:05:00,400 --> 00:05:15,300
# This is an example of
# a subtitle.

# 2
# 00:05:16,400 --> 00:05:25,300
# This is an example of
# a subtitle - 2nd subtitle.

require 'time'
require 'securerandom'

module CameraMan
  module Medias
    module Subtitles
      class CreateFile
        def initialize(subtitles)
          @subtitles = subtitles
        end

        def call
          output = "tmp/#{SecureRandom.uuid}.str"

          file = File.new(output, 'w')
          file.puts(file_content)
          file.close

          output
        end

        private

        def file_content = file_texts.join("\n\n")

        def file_texts
          index = 0

          @subtitles.map do |s|
            index += 1
            "#{index}\n" \
            "#{format_timestamp(s.starts_at)} --> #{format_timestamp(s.ends_at)}" \
            "\n#{s.sentence}"
          end
        end

        def format_timestamp(time)
          Time.at(time).utc.strftime('%H:%M:%S,%L')
        end
      end
    end
  end
end

