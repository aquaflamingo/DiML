class Point < Keyword
    @@interpreted_value = "point."
    @@markup_prefix = "*"

  def identify
    "point"
  end
end

