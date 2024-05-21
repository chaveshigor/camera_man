# frozen_string_literal: true

require 'camera_man/errors'

module CameraMan
  module Medias
    module Subtitles
      module Errors
        class InvalidSubtitleExtension < ::CameraMan::Errors::CameraManError
          def message = 'The extension needs to be .str'
        end
      end
    end
  end
end
