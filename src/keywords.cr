require_relative './heading.cr'
require_relative './section.cr'
require_relative './point.cr'
require_relative './end.cr'

module Keywords
  ALL = [
    Heading,
    Section,
    Point,
    End
  ]

  def self.find_klass(content)
    found_klasses  = ALL.select do |kw|
      kw.try?(v)
    end

    raise ArgumentError.new("Provided content is not a keyword") if found_klasses.empty?

    found_klasses.first
  end

  # 
  # Returns whether or not the supplied value is a keyword
  #
  def self.is_kw?(v: String)
    ALL.select do |kw|
      kw.try?(v)
    end.empty?
  end
end
