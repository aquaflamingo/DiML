require 'stringio'
require_relative '../content'
require_relative '../keywords/section'
require_relative '../keywords/heading'
require_relative '../keywords/point'
require_relative './markdown.rb'

module Format
  # Main Formatting class responsible for traversing the document content 
  # tree and rendering according to the strategy
  class Formatter
    # Decorator class for basic content
    # Receives an keyword in the DiML language and
    # renders it within the Markdown format.

    def initialize(diml_document, strategy = :markdown)
      @doc = diml_document
      @decorator = select_decorator(strategy)
    end

    # Creates a plain string of markdown 
    # For use by client to save as a file
    # if chosen.
    def format
      content_tree = @doc.content

      # If the root has no children just render an empty string
      if !content_tree.root?
        raise ArgumentError, "Document is invalid: no root found for content tree" 
      end

      if !content_tree.has_children?
        raise ArgumentError, "Document is invalid: no content found" 
      end

      io = StringIO.new
      recursive_render(content_tree, io)
    end

    private
    def recursive_render(tree, doc_builder)
      # Recursive Render
      #   Start at root element
      #
      #   Base case:
      #     if there are no children
      #     return the node content decorated
      #   Otherwise:
      #     For each child in tree
      #       Recursive render

      if tree.leaf?
        # Do not render virtual elements
        db = write_to_document(doc_builder, tree.content)

        return db
      end

      db = write_to_document(doc_builder, tree.content)

      tree.children.each do |c|
        db = recursive_render(c, db)
      end

      return db
    end

    # 
    # Write the content element to the document after decorating it 
    #
    # Currently only supports Markdown format
    #
    def write_to_document(builder, element)
      builder.puts(@decorator.render(element)) unless element.virtual?

      return builder
    end

    def select_decorator(strategy)
      case strategy
      when :markdown
        Format::Markdown.new
      else
        raise ArgumentError, "Invalid decoration format: #{strategy}"
      end
    end
  end
end
