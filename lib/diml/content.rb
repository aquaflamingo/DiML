# frozen_string_literal: true

# Content is a basic class that represents a non-keyword value
# FIXME: move to grammar folder
class Content 
  attr_reader :content

  def initialize(value)
    @content = value
  end
end
