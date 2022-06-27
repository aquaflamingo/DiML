require "./document.cr"

module Diml
  VERSION = "0.1.0"

  def self.parse(input : String)
    Document.load(input)
  end
end
