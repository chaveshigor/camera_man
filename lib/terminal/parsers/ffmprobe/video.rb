# frozen_string_literal: true

require 'json'

module Terminal
  module Parsers
    module FFMProbe
      # This module is responsible for parse the
      # output of a terminal command made by ffmprobe
      module Video
        extend self

        def parse(input)
          JSON.parse(input, symbolize_names: true)
        end
      end
    end
  end
end

