# A Keyword is a special word in the lexicon of DiML.
# A Keyword is distinct from raw content
# Example: "section"
require "./element.cr"

class Keyword < Element
   @@interpreted_value : String?
   @@markup_prefix : String?

   getter content : String

   def initialize(@content : String)
   end

   def identify
    "nil"
   end

   def self.interpreted_value : String
    @@interpreted_value.not_nil!
   end

   def self.markup_prefix : String
    @@markup_prefix.not_nil!
   end

   def render
    "#{@@markup_prefix} #{@content}"
   end

   def self.try(v : String)
    puts "inside try"
    puts "v: #{v}"
    puts "v start with #{v.starts_with?(@@interpreted_value.not_nil!)}"
    # TODO: add more intelligence to this
    # i.e. not just starting with
    return false if v.nil?

    v.starts_with?(@@interpreted_value.not_nil!)
   end
end
