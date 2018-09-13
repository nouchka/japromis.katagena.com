.PHONY: build

build:
	mkdir -p /tmp/resume/
	cp fr.json /tmp/resume/resume.json
	docker-compose -f build.yml pull
	docker-compose -f build.yml up
	cp /tmp/resume/index.pdf ~/Desktop/CV.pdf
