# frozen_string_literal: true

# A Keyword is a special word in the lexicon of DiML.
# A Keyword is distinct from raw content
# Example: "section"
require_relative "./element"
require 'pry'

class Keyword < Element
  attr_reader :content

  def initialize(content)
    @content = content
  end

  def render
    "#{markup_prefix} #{@content}"
  end

  module ClassMethods
    def def_interpreted_value(value)
      define_singleton_method('interpreted_value') { value }
    end

    def def_markup_prefix(value)
      define_singleton_method('markup_prefix') { value }
    end

    def try(v)
      # TODO: add more intelligence to this
      # i.e. not just starting with
      return false if v.nil?

      v.start_with?(interpreted_value)
    end
  end
end
