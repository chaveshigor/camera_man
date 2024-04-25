# frozen_string_literal: true

require_relative 'camera_man/version'

module CameraMan
  require 'camera_man/config'
  module Errors
    require 'camera_man/errors'
  end

  module Medias
    require 'camera_man/medias/video'
  end

  require 'camera_man/project'

  private
  
  module Utils
    require 'camera_man/utils/file_path'
  end
end
