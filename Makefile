PROJECT=diml

all: install build 

build:
	 @crystal build src/main.cr -o bin/$(PROJECT)

install:
	@shards install

clean:
	 @rm ./bin/$(PROJECT)


