# frozen_string_literal: true

require 'terminal/ffmprobe/command'

RSpec.describe ::Terminal::FFMProbe::Command do
  describe '#create' do
    it 'creates the corrrect command to ffmprobe' do
      media_path = './tmp/teste.webm'
      media = Media.new(file_path: media_path)
      command_instance = described_class.new(media: media)

      expect(command_instance.create).to eq(
        'ffprobe -v quiet -print_format json -show_format -show_streams ' \
        "#{media_path}"
      )
    end
  end
end

class Media
  attr_reader :file_path

  def initialize(file_path:)
    @file_path = file_path
  end
end
