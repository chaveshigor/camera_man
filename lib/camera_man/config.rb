# frozen_string_literal: true

module CameraMan
  class Config
    ::Dir.mkdir('tmp') unless ::File.directory?('tmp')

    class << self
      attr_accessor :open_ai_api_token
    end

    def self.setup
      yield(self) if block_given?
    end
  end
end
