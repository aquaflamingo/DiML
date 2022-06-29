class Section < Keyword
	 def initialize(@content : String)
			@interpreted_value = "section"
      @markup_prefix = "#"
	 end

   def nestable?
    false
   end
end
