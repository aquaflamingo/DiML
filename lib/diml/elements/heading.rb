# frozen_string_literal: true

require_relative "./keyword"

class Heading < Keyword
  extend Keyword::ClassMethods

  def_token "h."
end
