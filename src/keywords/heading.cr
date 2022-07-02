require "../keyword.cr"

class Heading < Keyword
  @@interpreted_value = "heading."
  @@markup_prefix = "##"

  def identify
    "heading"
  end
end
