# frozen_string_literal: true

module CameraMan
  module Medias
    class Audio
      attr_reader :starts_at, :ends_at

      def initialize(path:)
        @path = Types::FilePath.new(path)
      end

      def volume=(new_volume)
        new_volume.is_a?(Numeric) or fail Exceptions::InvalidVolume
        @volume = new_volume.to_f / 100
      end

      def volume = (@volume * 100).to_i

      def starts_at=(new_start)
        new_start.is_a?(Numeric) or fail Exceptions::InvalidTime
        @starts_at = new_start
      end

      def ends_at=(new_end)
        new_end.is_a?(Numeric) or fail Exceptions::InvalidTime
        @ends_at = new_end
      end
    end
  end
end

