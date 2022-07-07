# frozen_string_literal: true

require_relative "../keyword"

class Point < Keyword
  extend Keyword::ClassMethods

  def_interpreted_value "point."
  def_markup_prefix "#"
end
