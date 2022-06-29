# A Keyword is a special word in the lexicon of DiML.
# A Keyword is distinct from raw content
# Example: "section"
require "./element.cr"

abstract class Keyword < Element
	 getter interpreted_value: String
	 getter markup_prefix: String
	 getter content: String

   def render
    "#{markup_prefix} #{content}"
   end

   def self.try(v: String)
    # TODO: add more intelligence to this
    # i.e. not just starting with
    v.starts_with?(@interpreted_value)
   end
end
