# Document is a tree 
# Each tree node is an element
require "./content_tree.cr"

class Document 
  def initialize(@content : ContentTree)
  end

  def self.load(path : String)
    c = File.read(path) 

    ContentTree::Parser.parse(c)
  end
end
