# Content is a basic class that represents a non-keyword value 

require "./element.cr"

class Content < Element
  def initialize(@value : String)
  end

  def identify
    "content"
  end

  def render
    raise ArgumentError.new("not implemented")
  end
end
