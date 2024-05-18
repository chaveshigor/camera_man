# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CameraMan::Medias::Subtitles::Record do
  describe '#initialize' do
    context 'when initialize with file' do
      it 'initialize the class' do
        subtitles = described_class.new(path: 'spec/fixtures/test.str')

        expect(subtitles.is_a?(described_class)).to be(true)
      end
    end

    context 'when initialize with subtitles_object' do
      it 'initialize the class' do
        subtitles_object = [
          {
            sentence: 'hello',
            starts_at: 0.25,
            ends_at: 0.29
          },
          {
            sentence: 'hi',
            starts_at: 0.40,
            ends_at: 0.45
          }
        ]
        subtitles = described_class.new(subtitles: subtitles_object)

        expect(subtitles.path).not_to eq(nil)
      end
    end
  end
end

