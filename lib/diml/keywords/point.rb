# frozen_string_literal: true

require "../keyword"

class Point < Keyword
  @@interpreted_value = "point."
  @@markup_prefix = "*"

  def identify
    "point"
  end
end
