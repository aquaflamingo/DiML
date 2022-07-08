# frozen_string_literal: true

require_relative "./heading"
require_relative "./section"
require_relative "./point"

module Keywords
  ALL = [
    Heading,
    Section,
    Point
  ].freeze

  def self.build_from(content)
    found_klasses = ALL.select do |kw|
      kw.try(content)
    end

    raise ArgumentError, "Provided content is not a keyword" if found_klasses.empty?

    klass = found_klasses.first

    # Split the content into two parts the keyword, and content.
    # @Example: Q. headingvalue -> [Q., headingvalue]
    _, remaining = content.split(klass.token)

    stripped = if remaining.nil? || remaining.empty?
                  ""
               else
                  remaining.strip
               end
    # Instantiate the keyword class with the content
    klass.new(stripped)
  end

  #
  # Returns whether or not the supplied value is a keyword
  #
  def self.is_kw?(v)
    !ALL.select do |kw|
      kw.try(v)
    end.empty?
  end
end
