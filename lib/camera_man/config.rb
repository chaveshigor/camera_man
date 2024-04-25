# frozen_string_literal: true

module CameraMan
  class Config
    class << self
      attr_accessor :open_ai_api_token
    end

    def self.setup
      yield(self) if block_given?
    end
  end
end
