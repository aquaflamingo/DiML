# frozen_string_literal: true

# A Keyword is a special word in the lexicon of DiML.
# A Keyword is distinct from raw content
# Example: "section"
require "./element"

class Keyword < Element
  attr_reader :content

  def initialize(content)
    @content = content
  end

  def identify
    "nil"
  end

  def render
    "#{@markup_prefix} #{@content}"
  end

  def self.try(v)
    puts "inside try"
    puts "v: #{v}"
    puts "v start with #{v.starts_with?(@@interpreted_value.not_nil!)}"
    # TODO: add more intelligence to this
    # i.e. not just starting with
    return false if v.nil?

    v.starts_with?(@@interpreted_value.not_nil!)
  end
end
