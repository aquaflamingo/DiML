# frozen_string_literal: true

# Content is a basic class that represents a non-keyword value

require "./element"

class Content < Element
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def identify
    "content"
  end

  def render
    raise ArgumentError, "not implemented"
  end
end
