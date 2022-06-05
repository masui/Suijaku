# Scrapboxからコードを取得
# wgetは-r オプションで上書き
#
all:
	wget -q -r -O Makefile https://scrapbox.io/api/code/Suijaku/Makefile/Makefile
	make get

get:
	wget -q -r -O index.html https://scrapbox.io/api/code/Suijaku/index.html/index.html

push:
	git commit -a -m '...' ; git push

run:
	open index.html

# MacでApacheうごかしてテスト
# $ cd /Library/WebServer/Documents/; ln -s ~/Suijaku
# $ sudo apachectl start
local:
	open http://localhost/Suijaku/

# Cypressを使ったテスト (まだ無い)
test:
	npx cypress run -s cypress/integration/suijaku_test.js
test-gui:
	npx cypress open

lint:
	eslint hikizan.js
	eslint cypress/integration/hikizan_test.js

htmlcheck:
	open 'https://validator.w3.org/nu/?doc=https%3A%2F%2Fsuijaku.com&submit=Check'
