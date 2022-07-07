# frozen_string_literal: true

require_relative "./keyword"

class Root < Keyword
  attr_reader :content

  def initialize(content)
    super
    @content = content
  end
end
