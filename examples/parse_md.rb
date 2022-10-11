# frozen_string_literal: true

require "optionparser"
require_relative "../lib/diml"

opts = {}

# Input file in .diml format
# TODO could be file or input string
opts[:input] = ""

OptionParser.new do |parser|
  parser.banner = "Dictation Markup Language (DiML)"

  parser.on "-f VALUE", "-file VALUE", "Input file for parsing" do |f|
    opts[:input] = f
  end

  parser.on "-v", "--version", "Show version" do
    puts Diml::VERSION.to_s
    exit
  end

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
end.parse!

def diml_to_md(input)
  begin
    doc = Diml::Document.load(input)
  rescue => e
    puts "failed to parse: #{e.message}"
    exit 1
  end

  formatter = Diml::Formatter.new(doc, :markdown)

  formatter.format.string
end

puts diml_to_md(opts[:input])
