# frozen_string_literal: true

module CameraMan
  module Medias
    module Subtitles
      module Errors
        class InvalidSubtitleExtension < Errors::CameraManError
          def message = 'The extension needs to be .str'
        end
      end
    end
  end
end
