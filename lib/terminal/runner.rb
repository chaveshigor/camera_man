# frozen_string_literal: true

require 'stringio'

module Terminal
  # This module is responsible for execute
  # the terminal commands
  module Runner
    extend self

    def call(command:, output_parser: nil)
      output = capture_stdout(command)
      return output if output_parser.nil?

      output_parser.parse(output)
    end

    def capture_stdout(command)
      output = ''

      IO.popen(command) do |pipe|
        output = pipe.read
      end

      output.chop
    end
  end
end
