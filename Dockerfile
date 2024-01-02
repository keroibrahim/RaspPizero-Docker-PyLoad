FROM python:2.7-slim

RUN apt-get update && apt-get install -y libcurl4-openssl-dev gcc musl-dev curl libssl-dev
RUN apt autoremove
RUN rm -rf /var/lib/apt/lists/*
RUN pip install pycurl jinja2 beaker simplejson pycryptodome
#ADD unrar_4.1.4-1+deb7u1_armhf.deb /tmp/unrar.deb python-pycurl

#RUN dpkg -i /tmp/unrar.deb && rm /tmp/unrar.deb

COPY run.sh /run.sh
COPY pyload /opt/pyload
RUN echo "/opt/pyload/pyload-config" > /opt/pyload/module/config/configdir
RUN chmod +x /run.sh
RUN chmod +x /opt/pyload/pyLoadCore.py
ADD pyload-config/ /tmp/pyload-config

EXPOSE 8000 7227 9666
VOLUME ["/opt/pyload/pyload-config", "/opt/pyload/Downloads"]

CMD ["/run.sh"]
