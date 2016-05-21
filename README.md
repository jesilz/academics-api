Academics API [![Build Status](https://travis-ci.org/biola/academics-api.png)](https://travis-ci.org/biola/academics-api)
===========
RESTful APIs for Academic Data out of Banner.

Requirements
------------
- [Ruby](https://www.ruby-lang.org)
- [MongoDB](https://www.mongodb.org)
- [Rack web server](http://rack.github.io)

Installation
------------
```bash
git clone git@github.com:biola/academics-api.git
cd academics-api
bundle install
cp config/mongoid.yml.example config/mongoid.yml
cp config/newrelic.yml.example config/newrelic.yml
```

Configuration
-------------
- Edit `config/mongoid.yml` accordingly.
- Edit `config/newrelic.yml` accordingly.

Console
-------
To launch a console, `cd` into the app directory and run `irb -r ./config/environment.rb`
