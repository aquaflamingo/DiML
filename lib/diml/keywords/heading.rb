# frozen_string_literal: true

require "../keyword"

class Heading < Keyword
  @@interpreted_value = "heading."
  @@markup_prefix = "##"

  def identify
    "heading"
  end
end
