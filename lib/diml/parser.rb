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

    # TODO
  end

  private

  def build_tree(ctree, tokens)
    # Basic case: if there are no nestable tokens
    return ctree if tokens.empty?

    next_token = tokens.first

    element = ElementFactory.new_element(next_token)

    puts "next token is #{next_token}"

    case element.class.name
    when Section.name
      puts "Element is Section"
    when Heading.name
      puts "Element is Heading"
    when Point.name
      puts "Element is Point"
    else
      puts "Element is Content"
    end

    binding.pry
    puts element
    # Algo (Parsing and Tokenizing):
    #   1. Tokenize the elements based on splitting by semi colons
    #   2. For each token
    #     2.a Instantiate an element
    #       - The element determines what type of class to instantiate under the hood
    #     2.b With the created element append to the tree and dig further to see how to continue building the tree
    #
    # TODO: finish algorithm
    ctree
  end
end
