# frozen_string_literal: true

require_relative "./keyword"

class Point < Keyword
  extend Keyword::ClassMethods

  def_token "p."
end
