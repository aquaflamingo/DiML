# frozen_string_literal: true

# Abstract
class Element
  def initialize
    raise "Cannot initialize abstract class Element"
  end

  def render; end
end
