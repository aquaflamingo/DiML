# frozen_string_literal: true

require_relative "./content"
require_relative "./keywords"

# Element is a concrete implementation of Element
# It is used in conjunction with a ContentTree and is renderable
class Factory
  # Factory method for creating the appropriate class under the hood via the token
  def self.new_element(content)
    if Keywords.is_kw?(content)
      Keywords.build_from(content)
    else
      Content.new(content)
    end
  end
end
