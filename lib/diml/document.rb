# frozen_string_literal: true

# Document is a tree
# Each tree node is an element
require_relative "./parser"
require_relative "./content_tree"

class Document
  attr_reader :content

  def initialize(content_tree)
    @content = content_tree
  end

  def self.load(path)
    c = File.read(path)

    new(Parser.new(c).parse)
  end
end
