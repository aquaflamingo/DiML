# frozen_string_literal: true

# Document is a tree
# Each tree node is an element
require_relative "./parser"
require_relative "./content_tree"

class Document
  def initialize(content_tree)
    @tree = content_tree
  end

  def self.load(path)
    c = File.read(path)

    p = Parser.new(c)
    p.parse
  end
end
