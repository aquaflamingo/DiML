
abstract class Element
  abstract def render

  def nestable?
    true
  end

  # TODO: should the element decide whether or not its a content or keyword and based on that instantiate the proper keyword type
end

# ContentElement is a concrete implementation of Element
# It is used in conjunction with a ContentTree and is renderable
class ElementFactory
  # Factory method for creating the appropriate class under the hood via the token
  def new_element(content : String)
    Token.parse(content)
  end
end
