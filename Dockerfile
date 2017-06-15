FROM nouchka/hackmyresume-web
MAINTAINER Jean-Avit Promis "docker@katagena.com"
LABEL org.label-schema.vcs-url="https://github.com/nouchka/japromis.katagena.com"
LABEL version="latest"

ENV RESUME_JSON_URL https://raw.githubusercontent.com/nouchka/japromis.katagena.com/fr/resume.json
ENV OUTPUT_TEMPLATE kendall
ENV EMAIL docker@katagena.com
ENV PHONE +33602030405
ENV ADDRESS 25 Rue Delphin Loche

COPY resume-start.sh /resume-start.sh
COPY nginx.sh /nginx.sh

COPY resume.json /usr/share/nginx/html/resume.json
RUN /resume-start.sh

RUN apt-get purge --auto-remove -y curl wkhtmltopdf && \
	npm ls -gp --depth=0 | awk -F/ '/node_modules/ && !/\/npm$/ {print $NF}' | xargs npm -g rm && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /nginx.sh
