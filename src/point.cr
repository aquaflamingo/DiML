class Point < Keyword
	 def initialize
			@interpreted_value = "point."
      @markdown_value = "*"
	 end

   def render
    raise ArgumentError.new("Not implemented")
   end
end

