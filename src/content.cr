# Content is a basic class that represents a non-keyword value 
class Content < Element
  def initialize(@value : String)
  end

  def render
    raise ArgumentError.new("not implemented")
  end
end
