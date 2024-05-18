# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CameraMan::Medias::Video do
  describe '#metadata' do
    it 'shows all metadata' do
      video = described_class.new(file_path: 'spec/fixtures/test.mp4')

      expect(video.metadata.bit_rate).to eq(612209)
      expect(video.metadata.duration).to eq(48.001)
      expect(video.metadata.encoder).to eq('Lavf58.76.100')
      expect(video.metadata.end_time).to eq(48.001)
      expect(video.metadata.format_long_name).to eq('QuickTime / MOV')
      expect(video.metadata.format_name).to eq('mov,mp4,m4a,3gp,3g2,mj2')
      expect(video.metadata.height).to eq(1080)
      expect(video.metadata.language).to eq('eng')
      expect(video.metadata.resolution).to eq([1920, 1080])
      expect(video.metadata.size).to eq(3673331)
      expect(video.metadata.start_time).to eq(0.0)
      expect(video.metadata.title).to eq(nil)
      expect(video.metadata.width).to eq(1920)
    end
  end

  describe '#resolution' do
    it 'set the correct resolution in the initializer' do
      new_resolution = [1366, 768]
      video = described_class.new(
        file_path: 'spec/fixtures/test.mp4',
        resolution: new_resolution
      )

      expect(video.resolution).to eq(new_resolution)
    end

    it 'set the correct resolution with the setter' do
      new_resolution = [1366, 768]
      video = described_class.new(file_path: 'spec/fixtures/test.mp4')
      video.resolution = new_resolution

      expect(video.resolution).to eq(new_resolution)
    end

    context 'when resolution is invalid' do
      it 'raise an error' do
        new_resolution = ['1366', 768]
        video = described_class.new(file_path: 'spec/fixtures/test.mp4')

        expect { video.resolution = new_resolution }.to raise_error(
          CameraMan::Errors::InvalidResolution,
          'The resolution is invalid. It must be an Array like [1366, 768]'
        )
      end
    end
  end

  describe '#aspect_ratio' do
    it 'set the correct aspect ratio in the initializer' do
      new_aspect_ratio = [16, 9]
      video = described_class.new(file_path: 'spec/fixtures/test.mp4', aspect_ratio: new_aspect_ratio)

      expect(video.aspect_ratio).to eq(new_aspect_ratio)
    end

    it 'set the correct aspect ratio with the setter' do
      new_aspect_ratio = [16, 9]
      video = described_class.new(file_path: 'spec/fixtures/test.mp4')
      video.aspect_ratio = new_aspect_ratio

      expect(video.aspect_ratio).to eq(new_aspect_ratio)
    end

    context 'when aspect ratio is invalid' do
      it 'raise an error' do
        new_aspect_ratio = ['nine', 8]
        video = described_class.new(file_path: 'spec/fixtures/test.mp4')

        expect { video.aspect_ratio = new_aspect_ratio }.to raise_error(
          CameraMan::Errors::InvalidAspectRatio,
          'The aspect ratio is invalid. It must be an Array like [16, 9]'
        )
      end
    end
  end

  describe '#starts_at' do
    it 'set the correct start time in the initializer' do
      start_time = 2
      video = described_class.new(file_path: 'spec/fixtures/test.mp4', starts_at: start_time)

      expect(video.starts_at).to eq(start_time)
    end

    it 'set the correct start time with the setter' do
      start_time = 1
      video = described_class.new(file_path: 'spec/fixtures/test.mp4')
      video.starts_at = start_time

      expect(video.starts_at).to eq(start_time)
    end

    context 'when start time is invalid' do
      it 'raise an error' do
        start_time = 'one'
        video = described_class.new(file_path: 'spec/fixtures/test.mp4')

        expect { video.starts_at = start_time }.to raise_error(
          CameraMan::Errors::InvalidTime,
          'The time must be an amount of seconds (integer)'
        )
      end
    end
  end

  describe '#ends_at' do
    it 'set the correct end time in the initializer' do
      ends_at = 2
      video = described_class.new(file_path: 'spec/fixtures/test.mp4', ends_at: ends_at)

      expect(video.ends_at).to eq(ends_at)
    end

    it 'set the correct end time with the setter' do
      ends_at = 1
      video = described_class.new(file_path: 'spec/fixtures/test.mp4')
      video.ends_at = ends_at

      expect(video.ends_at).to eq(ends_at)
    end

    context 'when end time is invalid' do
      it 'raise an error' do
        ends_at = 'one'
        video = described_class.new(file_path: 'spec/fixtures/test.mp4')

        expect { video.ends_at = ends_at }.to raise_error(
          CameraMan::Errors::InvalidTime,
          'The time must be an amount of seconds (integer)'
        )
      end
    end
  end
end
