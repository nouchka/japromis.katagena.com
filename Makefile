.PHONY: build

build:
	mkdir -p /tmp/resume/
	cp fr.json /tmp/resume/resume.json
	docker-compose -f build.yml pull
	docker-compose -f build.yml up
	cp /tmp/resume/index.pdf ~/Desktop/CV.pdf

publish:
	npm install hackmyresume@">=1.3.0 <2" -g
	wget https://raw.githubusercontent.com/nouchka/docker-hackmyresume/master/start.sh
	chmod +x ./start.sh
	export RESUME_FILE=resume.json && export EMAIL=ja.promis@katagena.com && export PHONE=0102030405 && export ADDRESS=Bergerac && export OUTPUT_TEMPLATE=kendall && export TEMPLATE_GIT=https://github.com/nouchka/jsonresume-theme-kendall.git && ./start.sh
