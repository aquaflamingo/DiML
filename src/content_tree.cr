require "./element.cr"
#
# Basic multi child Tree datastructure
#
class ContentTree
  class Parser
    def self.parse(raw : String)
      # Algo (Parsing and Tokenizing):
      #   1. Tokenize the elements based on splitting by semi colons
      #   2. For each token 
      #     2.a Instantiate an element 
      #       - The element determines what type of class to instantiate under the hood
      #     2.b With the created element append to the tree and dig further to see how to continue building the tree
      #
      # TODO: finish algorithm
    end
  end

  getter children : Array(Element)
  getter parent : ContentTree

  def initialize
    @children  = [] of Element
    @parent  = nil
  end

  def add_child(child : ContentTree)
    child.parent = child
    @children << child
  end

  def root!
    @parent = nil
  end

  def root?
   !@parent.present?
  end

  def has_children?
    @children.size > 0
  end

  def leaf?
    !has_children?
  end
end
