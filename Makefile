all: Base64.min.js

Base64.min.js: Base64.js
	uglifyjs --no-copyright --output Base64.min.js Base64.js
	
Base64.js:
	coffee -c Base64.coffee

lint:
	coffeelint Base64.coffee

docs:
	codo --name 'Base64' --title 'Base64 API Documentation' Base64.coffee
	docco --output annotated-src Base64.coffee

clean:
	rm -rf Base64.js Base64.min.js doc annotated-src

test: Base64.js
	coffeelint test.coffee
	mocha --reporter spec --compilers coffee:coffee-script test.coffee
