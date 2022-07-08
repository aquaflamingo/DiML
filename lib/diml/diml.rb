# frozen_string_literal: true

require_relative "./document"
require_relative "./format/markdown"

module Diml
  VERSION = "0.1.0"

  def self.parse(input)
    doc = Document.load(input)

    formatter = Format::Markdown.new(doc)

    formatter.render.string
  end
end
