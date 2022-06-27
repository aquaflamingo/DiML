class End < Keyword
	 def initialize
			@interpreted_value = ";"
			@markdown_value = "\n"
	 end

   def render
    raise ArgumentError.new("Not implemented")
   end
end
