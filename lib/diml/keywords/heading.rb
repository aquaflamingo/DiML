# frozen_string_literal: true

require_relative "../keyword"

class Heading < Keyword
  extend Keyword::ClassMethods

  def_interpreted_value "heading."
  def_markup_prefix "##"
end
