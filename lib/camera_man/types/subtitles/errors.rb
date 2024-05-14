# frozen_string_literal: true

module CameraMan
  module Types
    module Subtitles
      module Errors
        class Invalid < CameraMan::Errors::CameraManError
          def initialize(subtitle)
            error = "[#{subtitle}] is not a valid subtitle. It should be an array"
            super(error)
          end
        end

        class InvalidElement < CameraMan::Errors::CameraManError
          def initialize(element, schema)
            error = "[#{element}] is not a valid subtitle element. " \
                    "The element schema should be #{schema}"
            super(error)
          end
        end
      end
    end
  end
end
