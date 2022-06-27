require "./content.cr"

class Token
  # Parses the individual token into its essential keyword or non-keyword (content element)
  def parse(value : String)
    if Keywords.is_kw?(value)
      Keywords.find_klass(value)
    else
      Content.new(value)
    end
  end
end


