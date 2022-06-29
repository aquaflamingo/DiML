class Heading < Keyword
	 def initialize(@content : String)
			@interpreted_value = "heading."
			@markup_prefix = "##"
	 end
end
