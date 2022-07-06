# frozen_string_literal: true

require "../keyword"

class Section < Keyword
  @@interpreted_value = "section"
  @@markup_prefix = "#"

  def identify
    "section"
  end
end
