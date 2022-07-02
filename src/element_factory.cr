require "./content.cr"
require "./keywords/keywords.cr"

# ContentElement is a concrete implementation of Element
# It is used in conjunction with a ContentTree and is renderable
class ElementFactory
  # Factory method for creating the appropriate class under the hood via the token
  def self.new_element(content : String) : Element
    if Keywords.is_kw?(content)
      Keywords.build_from(content)
    else
      Content.new(content)
    end
  end
end
