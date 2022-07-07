# frozen_string_literal: true

require_relative "../keyword"

class Section < Keyword
  extend Keyword::ClassMethods

  def_interpreted_value "section."
  def_markup_prefix "#"
end
