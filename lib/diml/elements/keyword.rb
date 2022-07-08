# frozen_string_literal: true

# A Keyword is a special word in the lexicon of DiML.
# A Keyword is distinct from raw content
# Example: "section"
require "pry"

class Keyword
  attr_reader :content

  def initialize(content)
    @content = content
  end

  # Returns whether or not the keyword is intended to be a virtual or concrete element
  # By default keywords should be non-virtual
  def virtual?
    false
  end

  module ClassMethods
    def def_token(value)
      define_singleton_method("token") { value }
    end

    def try(v)
      # TODO: add more intelligence to this
      # i.e. not just starting with
      return false if v.nil?

      v.start_with?(token)
    end
  end
end
