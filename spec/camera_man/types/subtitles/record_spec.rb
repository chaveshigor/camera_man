# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CameraMan::Types::Subtitles::Record do
  describe '#initialize' do
    context 'when an invalid object is passed' do
      context 'when nil is passed' do
        it 'raises an error' do
          expect { described_class.new(nil) }.to raise_error(
            CameraMan::Types::Subtitles::Errors::Invalid, 
            '[] is not a valid subtitle. It should be an array'
          )
        end
      end

      context 'when a string is passed' do
        it 'raises an error' do
          expect { described_class.new('test') }.to raise_error(
            CameraMan::Types::Subtitles::Errors::Invalid, 
            '[test] is not a valid subtitle. It should be an array'
          )
        end
      end

      context 'when pass a subtitle with an invalid schema' do
        it 'raises an error' do
          valid_schema = {
            starts_at: Numeric,
            ends_at: Numeric,
            sentence: String
          }

          invalid_subtitle = [{starts_at: '5.7', ends_at: 6.5, sentence: 'This is a text'}]

          expect { described_class.new(invalid_subtitle) }.to raise_error(
            CameraMan::Types::Subtitles::Errors::InvalidElement,
            "[#{invalid_subtitle.first}] is not a valid subtitle element. " \
            "The element schema should be #{valid_schema}"
          )
        end
      end
    end

    context 'when a valid object is passed' do
      it 'returns the subtitle object' do
        valid_subtitles = [{starts_at: 5.7, ends_at: 6.5, sentence: 'This is a text'}]

        expect { described_class.new(valid_subtitles) }.not_to raise_error(
          CameraMan::Types::Subtitles::Errors::InvalidElement
        )

        subtitles = described_class.new(valid_subtitles)

        expect(subtitles.data.first.starts_at).to eq(5.7)
        expect(subtitles.data.first.ends_at).to eq(6.5)
        expect(subtitles.data.first.sentence).to eq('This is a text')
      end
    end
  end
end
