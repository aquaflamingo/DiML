# frozen_string_literal: true

require_relative "./element"
require_relative "./root"

#
# Basic multi child Tree datastructure
#
class ContentTree
  # Elements
  attr_accessor :content, :parent
  # ContentTree, Array<ContentTree>
  attr_reader :children

  def initialize
    @children = []
    @parent = nil
    @content = nil
  end

  def add_child(child)
    child.parent = self
    @children << child
  end

  def root!
    @parent = nil
  end

  def root?
    @parent.nil?
  end

  def has_children?
    @children.size.positive?
  end

  def leaf?
    !has_children?
  end
end
