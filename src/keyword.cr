# A Keyword is a special word in the lexicon of DiML.
# A Keyword is distinct from raw content
# Example: "section"
require "./element.cr"

abstract class Keyword < Element
	 getter interpreted_value: String
	 getter markdown_value: String

   def self.try(v: String)
    v == @interpreted_value
   end
end
