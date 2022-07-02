# Document is a tree 
# Each tree node is an element
require "./parser.cr"
require "./content_tree.cr"

class Document 
  def initialize(@content : ContentTree)
  end

  def self.load(path : String)
    c = File.read(path) 

    p = Parser.new(c)
    p.parse
  end
end
