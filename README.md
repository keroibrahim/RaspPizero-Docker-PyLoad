PyLoad for Raspberry Pi (as Dock)
=========
Introduction
----
pyLoad is a fast, lightweight and full featured download manager for many One-Click-Hoster, container formats like DLC, video sites or just plain http/ftp links. It aims for low hardware requirements and platform independence to be runnable on all kind of systems (desktop pc, netbook, NAS, router).

Despite its strict restriction it is packed full of features just like webinterface, captcha recognition, unrar and much more.

pyLoad is divided into core and clients, to make it easily remote accessible. Currently there are a webinterface, command line interface, and a GUI written in Qt.

Source [official pyload]

Install
----
Install is easy as all docker images

```sh
docker pull kerollos29/pyload-armv6
```

Running
----

```sh
docker run -it -d -v /root/downloads:/opt/pyload/Downloads -v /root/pyload:/opt/pyload/pyload-config --name pyload -p 8000:8000 -p 9666:9666 kerollos29/pyload-armv6
```

Configuration
----
You can link your Downloads to your host very easy like that:

```sh
docker run -d -v <host directoy>:/opt/pyload/Downloads -P kerollos29/pyload-armv6
```
Notice to replace ```<host directory>``` with your directory path on the host. So if you want to store your Downloads in ```/tmp/Downloads``` then your command would look like this:

```sh
docker run -d -v /tmp/Downloads:/opt/pyload/Downloads -P kerollos29/pyload-armv6
```
If you want to have your configuration persistent you have to link the configuration directory outside of the container. This can happen like this:

```sh
docker run -d -v <host directoy>:/opt/pyload/pyload-config -P kerollos29/pyload-armv6
```

Example, if all possible config options are used:
```sh
docker run -d -p 8000:8000 -p 7227:7227 -v /opt/pyload/downloads:/opt/pyload/Downloads -v /opt/pyload/config:/opt/pyload/pyload-config --name pyload kerollos29/pyload-armv6
```


Finally
----
After the docker has created you can login via the webinterface with:

```sh
USER=pyload
PASSWORD=pyload
```


[official pyload]:http://pyload.org/

