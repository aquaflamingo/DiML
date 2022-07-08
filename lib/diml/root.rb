# frozen_string_literal: true

require_relative "./keyword"

class Root < Keyword
  # Root is a special keyword that the DIML document does not specify, but is used to start the tree
  def virtual?
    true
  end
end
