# frozen_string_literal: true

require 'terminal/runner'

RSpec.describe Terminal::Runner do
  describe '#call' do
    context 'when output parser is not passed' do
      it 'returns the result as a string' do
        command = "echo 'hello world'"
        result = described_class.call(command: command)

        expect(result).to eq('hello world')
      end
    end

    context 'when output parser is passed' do
      it 'returns the parsed output' do
        command = "echo 'hello,world'"
        result = described_class.call(command: command, output_parser: TestParser)

        expect(result).to eq(%w[hello world])
      end
    end
  end
end

module TestParser
  extend self

  def parse(input)
    input.split(',')
  end
end
