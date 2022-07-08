# frozen_string_literal: true

require_relative "../elements/factory.rb"
require_relative "../elements/section"
require_relative "../elements/point"
require_relative "../elements/heading"

# Basic document parser
module Diml
class Parser
  def initialize(raw_content)
    @raw_content = raw_content
  end

  # Parses the raw content for a DIML document into
  # the internal representation.
  def parse
    basic_tokens = @raw_content.split(";")

    # Create new Content Tree
    ctree = ContentTree.new
    ctree.content = Root.new("")
    ctree.root!

    tree = build_tree(ctree, basic_tokens)

    # Return the root not the last value
    t = tree
    t = t.parent until t.root?
    t
  end

  private

  # Recursive content tree builder
  def build_tree(ctree, tokens)
    # Basic case: if there are no nestable tokens
    return ctree if tokens.empty?

    # Pull first element from the start of the array
    next_token = tokens.first.strip
    tokens = tokens.drop(1)

    # Create a new element
    element = Factory.new_element(next_token)

    case element.class.name
    when Section.name
      if ctree.root?
        # Sections can only belong as children to the root. 
        child = add_to_tree(ctree, element)
      else 
        # Continue to traverse upwards until you find the root
        ancestor = ctree.parent
        ancestor = ancestor.parent until ancestor.root?

        # Ancestor is root. Insert this section.
        child = add_to_tree(ancestor, element)
      end

      build_tree(child, tokens)
    when Heading.name
      if ctree.content.instance_of? Section
        # Headings can only belong to sections
        child = add_to_tree(ctree, element)
      else
        ancestor = ctree.parent
        ancestor = ancestor.parent until ancestor.content.instance_of? Section

        # Ancestor is root. Insert this section.
        child = add_to_tree(ancestor, element)
      end

      build_tree(child, tokens)
    when Point.name
      if ctree.content.instance_of? Heading
        # Headings can only belong to sections
        child = add_to_tree(ctree, element)
      else
        ancestor = ctree.parent
        ancestor = ancestor.parent until ancestor.content.instance_of? Heading

        # Ancestor is root. Insert this section.
        child = add_to_tree(ancestor, element)
      end
      
      build_tree(child, tokens)
    end

    ctree
  end

  # Helper method to create and add a new element to a content tree
  def add_to_tree(tree, child_element)
    child = ContentTree.new
    child.parent = tree
    child.content = child_element
    tree.add_child(child)

    child
  end
end
end
