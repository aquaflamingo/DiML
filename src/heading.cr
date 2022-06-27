class Heading < Keyword
	 def initialize
			@interpreted_value = "heading."
			@markdown_value = "##"
	 end

   def render
    raise ArgumentError.new("Not implemented")
   end
end
