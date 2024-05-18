# frozen_string_literal: true

module TypeAssertion
  def assert(var, type)
    var => type

  rescue NoMatchingPatternError
    
  end
end