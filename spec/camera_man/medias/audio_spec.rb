# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CameraMan::Medias::Audio do
  describe '#initialize' do
  end

  describe '#volume' do
    context 'when set an invalid volume' do
      it 'raises an exception' do
        valid_path = 'spec/fixtures/audio.mp3'
        audio = described_class.new(path: valid_path)

        expect { audio.volume = '100' }.to raise_error(
          CameraMan::Medias::Exceptions::InvalidVolume, 'Invalid volume'
        )
      end
    end

    context 'when set a valid volume' do
      it 'stores the new volume' do
        valid_path = 'spec/fixtures/audio.mp3'
        audio = described_class.new(path: valid_path)
        audio.volume = 50

        expect(audio.volume).to eq(50)
      end
    end
  end

  describe 'starts_at' do
    context 'when pass an invalid value' do
      it 'raises an exception' do
        audio = described_class.new(path: 'spec/fixtures/audio.mp3')

        expect { audio.starts_at = '2' }.to raise_error(
          CameraMan::Medias::Exceptions::InvalidTime, 'Invalid time. Must be a numeric'
        )
      end
    end

    context 'when pass a valid value' do
      it 'stores the value' do
        audio = described_class.new(path: 'spec/fixtures/audio.mp3')

        audio.starts_at = 5
        expect(audio.starts_at).to eq(5)
      end
    end
  end

  describe 'ends_at' do
    context 'when pass an invalid value' do
      it 'raises an exception' do
        audio = described_class.new(path: 'spec/fixtures/audio.mp3')

        expect { audio.ends_at = '2' }.to raise_error(
          CameraMan::Medias::Exceptions::InvalidTime, 'Invalid time. Must be a numeric'
        )
      end
    end

    context 'when pass a valid value' do
      it 'stores the value' do
        audio = described_class.new(path: 'spec/fixtures/audio.mp3')

        audio.ends_at = 5
        expect(audio.ends_at).to eq(5)
      end
    end
  end
end

