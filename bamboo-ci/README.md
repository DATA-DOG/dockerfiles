# Atlassian Bamboo 5.10.1.1

## About

Bamboo is a continuous integration server.

For all aspects about configuring, using and administering bamboo please see [The Official Bamboo Documentation](https://confluence.atlassian.com/bamboo/bamboo-documentation-home-289276551.html).

## Include package

* Composer
* NPM
* Gulp
* Bower
* Ansible

## How to use?

The examples shown below assume you will use a MySQL database.

> Please pay attention to the IP addresses used in the examples below. The IP `192.168.1.2` refers to your host OS. The IP `172.17.0.2` refers to the MySQL database and the IP `172.17.0.3` to the newly installed Bamboo guest OS. To figure out the IP in your guest OS you can either connect to a running instance by issuing `docker exec -it [container-name] /bin/bash` and do `ifconfig` or locate the IP from `docker inspect [container-name]`.


### Prerequisites

* MySQL 5.5 or 5.6 (please notice that Bamboo is not compatible with MySQL 5.7)
* PostgreSQL 8.4+

> Important notice: The Postgres driver is shipped with the Bamboo distribution, whereas the MySQL driver will be downloaded when running the image.


#### Database Setup

MySQL setup (assuming that MySQL isn't installed yet):

```
$ docker run -d -p 3306:3306 --name mysql -v /var/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=[db-password] mysql/mysql-server:5.6
$ mysql -h 172.17.0.2 -u root -p[db-password]
CREATE DATABASE IF NOT EXISTS bamboo CHARACTER SET utf8 COLLATE utf8_bin;
```

If you use a default Docker installation with no images installed, the assigned IP for MySQL will be: `172.17.0.2`.

Optionally you may configure security constraints by:

```
GRANT ALL PRIVILEGES ON bamboo.* TO '[appuser]'@'172.17.0.3' IDENTIFIED BY '[apppassword]' with grant option;
```

> Please notice that the `[appuser]` and `[apppassword]` must be configured to what is appropriate for your system.


### Installation

Run docker using port 8085 on your host (if available):

```
docker run -p 8085:8085 descoped/bamboo
```


Run with data outside the container using a volume:

```
$ docker run --name bamboo -v /var/bamboo:/var/atlassian-home -e CONTEXT_PATH=ROOT -e DATABASE_URL=mysql://[username]:[password]@172.17.0.2bamboo -p 8085:8085 descoped/bamboo
```


To stop the running instance:

```
$ docker bamboo stop
```


To start running instance:

```
$ docker bamboo start
```


#### Docker Volume

The mappable VOLUME is: `/var/atlassian-home`

#### Browser URL:

```
http://192.168.1.2:8085/
```


The host IP is assumed to be `192.168.1.2`.


### Configuration

#### Database connection

The connection to the database can be specified with an URL of the format:
```
[database type]://[username]:[password]@[host]:[port]/[database name]
```


Where ```database type``` is either ```mysql``` or ```postgresql``` and the full URL look like this:

**MySQL:**

```
mysql://<username>:<password>@172.17.0.2/bamboo
```


**PostgreSQL:**

```
postgresql://<username>:<password>@172.17.0.2/bamboo
```


### Environement variables

Configuration options are set by setting environment variables when running the image. What follows it a table of the supported variables:

Variable        | Function
----------------|------------------------------
CONTEXT_PATH    | Context path of the Bamboo webapp. You can set this to add a path prefix to the url used to access the webapp. i.e. setting this to ```bamboo``` will change the url to http://192.168.1.2:8085/bamboo/. The value ```ROOT``` is reserved to mean that you don't want a context path prefix. Defaults to ```ROOT```
DATABASE_URL    | Connection URL specifying where and how to connect to a database dedicated to Bamboo. This variable is optional and if specified will cause the Bamboo setup wizard to skip the database setup set.
JNDI_DATASOURCE | Naming context for the JNDI datasource. A value of `bamboo` will set the JNDI Datasource to `java:comp/env/jdbc/bamboo`.