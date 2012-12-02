all: Base64.min.js

Base64.min.js: Base64.js
	uglifyjs --output Base64.min.js Base64.js
	
Base64.js:
	coffee -c Base64.coffee
	sed -i '' -e '1,2 d' -e '3 N;s/\n/ /;' -e '4 N;s/\n/ /;' Base64.js

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
