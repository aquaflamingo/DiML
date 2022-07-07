# frozen_string_literal: true

require_relative "./element"
require_relative "./root"

#
# Basic multi child Tree datastructure
#
class ContentTree
  # Element
  attr_accessor :content
  # ContentTree, Array<ContentTree>
  attr_reader :parent, :child

  def initialize
    @children = []
    @parent = nil
    @content = nil
  end

  def add_child(child)
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
    @children.size.positive?
  end

  def leaf?
    !has_children?
  end
end
