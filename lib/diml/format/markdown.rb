# frozen_string_literal: true

require_relative "../elements/point"
require_relative "../elements/heading"
require_relative "../elements/section"
require_relative "../elements/root"
require_relative "../elements/content"

module Format
  class Markdown
    # Maintains a map to conserve the translation values
    # of DIML lexicon to markdown prefixes.
    FORMAT_PREFIXES = {
      Point => "*",
      Heading => "##",
      Section => "#",
      Content => "",
      Root => ""
    }.freeze

    # Returns the element with appropriate
    def render(elem)
      prefix = FORMAT_PREFIXES[elem.class]

      raise ArgumentError, "Invalid element: #{elem.class}" if prefix.nil?

      "#{prefix} #{elem.content}"
    end
  end
end
