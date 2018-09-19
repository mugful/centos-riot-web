centos-riot-web
===============

A Riot-web Matrix client image built on top of CentOS.

Pull
----

Either pull from Quay.io:

    docker pull quay.io/mugful/centos-riot-web:master

Or build your own:

    git clone https://github.com/mugful/centos-riot-web
    cd centos-riot-web
    docker build --force-rm -t mugful/centos-riot-web:master .

Configure
---------

The container is pre-configured with very basic httpd serving the Riot
client via HTTP. It is recommended to *not* expose it directly to the
internet. Either preface it with a https proxy when using it, and you
might also want something like HTTP Basic auth to only serve it to
your target users. Or you can mount custom
`/etc/httpd/conf/httpd.conf` file, keys, and certificates to make the
container serve Riot via proper HTTPS with your desired httpd
configuration.

It is also recommended to override
`/var/www/html/riot-web/config.json` via a mount. See
the
[example riot-web config.json](https://github.com/vector-im/riot-web/blob/master/config.sample.json) for
inspiration.

Run
---

This will serve Riot on localhost:8080, and you can put an HTTPS
reverse proxy in front of it.

    docker run -d \
        --name my_riot \
        -p 127.0.0.1:8080:80 \
        quay.io/mugful/centos-riot-web:master
