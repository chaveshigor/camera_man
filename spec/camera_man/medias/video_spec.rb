# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CameraMan::Medias::Video do
  describe '#metadata' do
    it 'shows all metadata' do
      video = described_class.new(file_path: 'tmp/teste.webm')

      expect(video.metadata.bit_rate).to eq(4555646)
      expect(video.metadata.duration).to eq(4.949297)
      expect(video.metadata.encoder).to eq('GStreamer matroskamux version 1.20.3')
      expect(video.metadata.end_time).to eq(4.979297)
      expect(video.metadata.format_long_name).to eq('Matroska / WebM')
      expect(video.metadata.format_name).to eq('matroska,webm')
      expect(video.metadata.height).to eq(740)
      expect(video.metadata.language).to eq('eng')
      expect(video.metadata.resolution).to eq([1481, 740])
      expect(video.metadata.size).to eq(2818406)
      expect(video.metadata.start_time).to eq(0.03)
      expect(video.metadata.title).to eq('Video')
      expect(video.metadata.width).to eq(1481)
    end
  end
end
