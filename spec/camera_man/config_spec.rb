# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CameraMan::Config do
  describe '#setup' do
    it 'save the gem configs' do
      described_class.setup do |config|
        config.open_ai_api_token = '123'
      end

      expect(described_class.open_ai_api_token).to eq('123')
    end
  end
end
