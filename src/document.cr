# Document is a tree 
# Each tree node is an element
class Document 
	 class << self
			def load(path: String)
						 content = File.read(path) 

						parse_tree(content)
			end

			private def parse_tree(raw: String)
				 # TODO - Look ahead token parsing or just basic semi-colon splits?
			end
	 end
end
