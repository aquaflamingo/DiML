# frozen_string_literal: true

require "./keyword"

class Root < Keyword
  attr_reader :content

  def initialize(content)
    super
    @content = content
  end
end
