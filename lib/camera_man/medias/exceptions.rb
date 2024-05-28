# frozen_string_literal: true

module CameraMan
  module Medias
    module Exceptions
      class Error < CameraMan::Errors::CameraManError
      end

      class InvalidVolume < Error
        def message = 'Invalid volume'
      end

      class InvalidTime < Error
        def message = 'Invalid time. Must be a numeric'
      end
    end
  end
end

