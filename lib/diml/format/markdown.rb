require 'stringio'
require_relative '../content'
require_relative '../keywords/section'
require_relative '../keywords/heading'
require_relative '../keywords/point'

module Format
  class Markdown
    # Decorator class for basic content
    # Receives an keyword in the DiML language and
    # renders it within the Markdown format.
    class Decorator
      # Maintains a map to conserve the translation values 
      # of DIML lexicon to markdown prefixes.
      FORMAT_PREFIXES = {
        Point => '*',
        Heading => '##',
        Section => '#',
        Content => '',
        Root => '',
      }

      def initialize(element)
        @element = element
      end

      # Returns the element with appropriate 
      def render
        prefix = FORMAT_PREFIXES[@element.class]

        raise ArgumentError, "Invalid element: #{@element.class}" if prefix.nil?

        "#{prefix} #{@element.content}"
      end
    end

    def initialize(diml_document)
      @doc = diml_document
    end

    # Creates a plain string of markdown 
    # For use by client to save as a file
    # if chosen.
    def render
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

    def write_to_document(builder, content)
      builder.puts(Decorator.new(content).render) unless content.virtual?
      return builder
    end
  end
end

