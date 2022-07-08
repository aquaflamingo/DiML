# frozen_string_literal: true

# Content is a basic class that represents a non-keyword value
#
class Content 
  attr_reader :content

  def initialize(value)
    @content = value
  end
end
