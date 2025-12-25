.PHONY: all clean help install preview publish

HUGO := hugo

help:
	@echo "Usage: make <command>"
	@echo "  all       Clean up build and publish site"
	@echo "  clean     Remove all build files"
	@echo "  install   Build minified site in public dir"
	@echo "  preview   Build site and start a local server for preview"
	@echo "  publish   Build site and rsync it to the server"

all: clean publish

clean:
	-rm -rf public

install:
	$(HUGO) --minify

preview:
	$(HUGO) server

publish:
	$(HUGO) --minify
	rsync -rv -e ssh --progress /home/pg/repos/prostbucht_gallery/public/ web01:/var/www/prostbucht/html
