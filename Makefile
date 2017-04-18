cover:
	-cp originalContracts/* contracts
	-rm -rf originalContracts
	( cd solcover ; node ./runCoveredTests.js ; cd ..  )
	open ./solcover/coverage/lcov-report/index.html

install:
	npm install truffle@3.2.1 -g
	npm install
	git clone http://github.com/adriamb/solcover.git
	( cd solcover ; npm install )

travis: install
	( cd solcover ; node ./runCoveredTests.js ; cd ..  )
	./node_modules/.bin/codecov