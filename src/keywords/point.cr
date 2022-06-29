class Point < Keyword
	 def initialize(@content : String)
			@interpreted_value = "point."
      @markup_prefix = "*"
	 end

   def nested?
    true
   end
end

