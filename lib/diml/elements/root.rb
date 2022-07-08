# frozen_string_literal: true

require_relative "./keyword"

# Root is a special element that the DIML document does not specify
# It is used to start the content tree
class Root < Keyword
  def virtual?
    true
  end
end
