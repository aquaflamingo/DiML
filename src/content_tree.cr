require "./element.cr"
require "./root.cr"

#
# Basic multi child Tree datastructure
#
class ContentTree
  getter children : Array(ContentTree)
  getter parent : ContentTree?
  property content : Element?

  def initialize
    @children  = [] of ContentTree
    @parent  = nil
    @content  = nil
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
