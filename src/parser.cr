require "./token.cr"
require "./element.cr"

class Parser
  def initialize(@raw_content : String) 
  end

  def parse
    basic_tokens = @raw_content.split(';')

    # Create new Content Tree
    ctree = ContentTree.new
    ctree.content = Section.new("Title")
    ctree.root!
    
    # Recursively build tree
    tree = build_tree(basic_tokens, ctree)

    # TODO
  end

  private def build_tree(ctree, tokens)
# Rough idea:
# For each elem, check if nestable. 
# If not nestable, cut the section and feed to the recursive builder
# |N|N|N|S|N|N|N|S|
#

    # Base case: if there are no nestable tokens 
    if tokens.empty?
      return ctree
    end

    elements = basic_tokens.each do |t|
      element = ElementFactory.new_element(t)

      if
      ctree.add_child(element)
    end

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
