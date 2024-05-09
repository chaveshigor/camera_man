# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CameraMan::Types::FilePath do
  describe '#new' do
    context 'when path is valid' do
      it 'should not raise' do
        expect { described_class.new('tmp/teste.webm') }.to_not raise_error
        expect { described_class.new('./tmp/teste.webm') }.to_not raise_error
      end
    end

    context 'when path is not a string' do
      it 'should raise an error' do
        expect { described_class.new(1) }.to raise_error(
          CameraMan::Errors::InvalidType, 'The filepath needs to be a String'
        )
      end
    end

    context 'when path is invalid' do
      it 'should raise an error' do
        expect { described_class.new('not valid') }.to raise_error(
          CameraMan::Errors::InvalidFilePath, 'The path is not valid'
        )
      end
    end

    context 'when file does not exists' do
      it 'should raise an error' do
        expect { described_class.new('tmp/not_exists.txt') }.to raise_error(
          CameraMan::Errors::FileNotFound, 'The file [tmp/not_exists.txt] was not found'
        )
      end
    end
  end

  describe '#to_s' do
    it 'returns the file_path' do
      filepath = described_class.new('tmp/teste.webm')

      expect(filepath.to_s).to eq('tmp/teste.webm')
      expect("#{filepath}").to eq('tmp/teste.webm')
    end
  end
end
