# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CameraMan::Medias::Subtitles::CreateFile do
  describe '#call' do
    it 'creates a new subtitle file' do
      subtitles = [ { starts_at: 1.1, ends_at: 1.5, sentence: 'hello world' } ]
      subtitles = subtitles.map { |s| CameraMan::Medias::Subtitles::Element.new(s) }
      output = described_class.new(subtitles).call

      expect(File.exist?(output)).to be(true)
    ensure
      File.delete(output)
    end
  end
end

