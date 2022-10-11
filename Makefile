PROJECT=diml

console:
	@bundle exec bin/console

setup:
	@bundle exec bin/setup

build:
	@bundle exec rake build

install:
	@bundle exec rake install

release:
	@bundle exec rake release

release.gh:
	@bundle exec rake release
	@gh release create
