module Format
  class Markdown
    # Maintains a map to conserve the translation values 
    # of DIML lexicon to markdown prefixes.
    FORMAT_PREFIXES = {
      Point => '*',
      Heading => '##',
      Section => '#',
      Content => '',
      Root => '',
    }

    # Returns the element with appropriate 
    def render(elem)
      prefix = FORMAT_PREFIXES[elem.class]

      raise ArgumentError, "Invalid element: #{elem.class}" if prefix.nil?

      "#{prefix} #{elem.content}"
    end
  end
end
