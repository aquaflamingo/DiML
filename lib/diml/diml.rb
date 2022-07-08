# frozen_string_literal: true

require_relative "./document"
require_relative "./format/formatter"

module Diml
  VERSION = "0.1.0"

  def self.parse(input)
    doc = Document.load(input)

    formatter = Format::Formatter.new(doc)
    formatter.format.string
  end
end
