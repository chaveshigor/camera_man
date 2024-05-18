# frozen_string_literal: true

require 'camera_man/medias/video'

module CameraMan
  class Project
    def initialize(output:)
      @output = output
      @medias = []
    end

    def add_video(file_path:)
      @medias << Medias::Video.new()
    end

    def add_audio; end
    def add_subtitle; end

    def render; end
  end
end

