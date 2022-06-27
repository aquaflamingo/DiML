class Section < Keyword
	 def initialize
			@interpreted_value = "section"
      @markdown_value = "#"
	 end

   def render
    raise ArgumentError.new("Not implemented")
   end
end
