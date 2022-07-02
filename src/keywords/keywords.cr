require "./heading.cr"
require "./section.cr"
require "./point.cr"

module Keywords
  ALL = [
    Heading,
    Section,
    Point,
  ]

  #
  def self.build_from(content)
    found_klasses  = ALL.select do |kw|
      kw.try(content)
    end


    raise ArgumentError.new("Provided content is not a keyword") if found_klasses.empty?

    klass = found_klasses.first

    # Split the content into two parts the keyword, and content.
    # @Example: Q. headingvalue -> [Q., headingvalue]
    _, remaining = content.split(klass.markup_prefix)

    # Instantiate the keyword class with the content
    klass.new(remaining.strip)
  end

  # 
  # Returns whether or not the supplied value is a keyword
  #
  def self.is_kw?(v : String)
    !ALL.select do |kw|
      kw.try(v)
    end.empty?
  end
end
