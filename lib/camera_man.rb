# frozen_string_literal: true

require_relative 'camera_man/version'

module CameraMan
  require 'camera_man/config'
  require 'camera_man/errors'

  module Types
    require 'camera_man/types/file_path'
  end


  module Medias
    require 'camera_man/medias/video'
    require 'camera_man/medias/subtitles/record'
  end

  require 'camera_man/project'
end
