# frozen_string_literal: true

require_relative "../keyword"

class Section < Keyword
  extend Keyword::ClassMethods

  def_token "section."
end
