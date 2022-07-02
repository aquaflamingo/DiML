require "../keyword.cr"

class Section < Keyword
  @@interpreted_value = "section"
  @@markup_prefix = "#"

  def identify
    "section"
  end
end
