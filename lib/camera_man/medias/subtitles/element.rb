# frozen_string_literal: true

module CameraMan
  module Medias
    module Subtitles
      class Element
        def initialize(element)
          @element = element.transform_keys(&:to_sym)

          valid_element?
        end

        def starts_at
          @element[:starts_at]
        end

        def ends_at
          @element[:ends_at]
        end

        def sentence
          @element[:sentence]
        end

        private

        ELEMENT_SCHEMA = {
          starts_at: Numeric,
          ends_at: Numeric,
          sentence: String
        }.freeze

        def valid_element?
          exception = Errors::InvalidElement.new(@element, ELEMENT_SCHEMA)

          @element.keys.sort == ELEMENT_SCHEMA.keys.sort or fail exception
          @element.each do |k, v|
            @element[k].is_a? ELEMENT_SCHEMA[k] or fail exception
          end
        end
      end
    end
  end
end

