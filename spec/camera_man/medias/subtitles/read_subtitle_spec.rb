# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CameraMan::Medias::Subtitles::ReadSubtitle do
  describe '#call' do
    it 'read the subtitles and returns an array of hashes' do
      path = 'spec/fixtures/test.str'
      result = described_class.new(path).call

      expect(result.first.starts_at).to eq(5 * 60 + 0.4)
      expect(result.first.ends_at).to eq(5 * 60 + 15 + 0.3)
      expect(result.first.sentence).to eq('This is an example of a subtitle.')

      expect(result.last.starts_at).to eq(5 * 60 + 16 + 0.4)
      expect(result.last.ends_at).to eq(5 * 60 + 25 + 0.3)
      expect(result.last.sentence).to eq('This is an example of a subtitle - 2nd subtitle.')
    end
  end
end

