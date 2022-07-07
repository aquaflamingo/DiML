# frozen_string_literal: true

require_relative "./element_factory"
require_relative "./keywords/section"
require_relative "./keywords/point"
require_relative "./keywords/heading"

class Parser
  def initialize(raw_content)
    @raw_content = raw_content
  end

  def parse
    basic_tokens = @raw_content.split(";")

    # Create new Content Tree
    ctree = ContentTree.new
    ctree.content = Root.new("")
    ctree.root!

    # Recursively build tree
    tree = build_tree(ctree, basic_tokens)

    t = tree
    t = t.parent until t.root?
    t
  end

  private

  def build_tree(ctree, tokens)
    # Basic case: if there are no nestable tokens
    return ctree if tokens.empty?

    # Pull first element from the start of the array
    next_token = tokens.first.strip
    tokens = tokens.drop(1)

    element = ElementFactory.new_element(next_token)

    case element.class.name
    when Section.name
      if ctree.root?
        # Sections can only belong as children to the root. 
        child = add_to_tree(ctree, element)
        build_tree(child, tokens)
      else 
        # Continue to traverse upwards until you find the root
        ancestor = ctree.parent
        ancestor = ancestor.parent until ancestor.root?

        # Ancestor is root. Insert this section.
        child = add_to_tree(ancestor, element)
        build_tree(child, tokens)
      end
    when Heading.name
      if ctree.content.instance_of? Section
        # Headings can only belong to sections
        child = add_to_tree(ctree, element)
        build_tree(child, tokens)
      else
        ancestor = ctree.parent
        ancestor = ancestor.parent until ancestor.content.instance_of? Section

        # Ancestor is root. Insert this section.
        child = add_to_tree(ancestor, element)
        build_tree(child, tokens)
      end
    when Point.name
      if ctree.content.instance_of? Heading
        # Headings can only belong to sections
        child = add_to_tree(ctree, element)
        build_tree(child, tokens)
      else
        ancestor = ctree.parent
        ancestor = ancestor.parent until ancestor.content.instance_of? Heading

        # Ancestor is root. Insert this section.
        child = add_to_tree(ancestor, element)
        build_tree(child, tokens)
      end
    else
      # FIXME: what to do with content?
    end

    ctree
  end

  def add_to_tree(tree, child_element)
    child = ContentTree.new
    child.parent = tree
    child.content = child_element
    tree.add_child(child)

    child
  end
end
