# frozen_string_literal: true

require "option_parser"
require "./diml"

opts {}

# Input file in .diml format
# TODO could be file or input string
opts[:input] = ""

OptionParser.parse do |parser|
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
end

Diml.parse(opts[:input])
