# Spoonful
[![Build Status](https://travis-ci.org/oahray/spoonful.svg?branch=main)](https://travis-ci.org/oahray/spoonful)


This is a simple project that consumes the Content Delivery API (Contentful).

#### Ruby version

This project was developed with Ruby 3.0.0 (the latest ruby version at the time of development) and Rails 6.1.3.


#### System dependencies

-  [Ruby](https://www.ruby-lang.org/en/downloads/)
-  [Rails](https://github.com/rails/rails)
-  Bundler- (ships with Ruby)
-  [Docker](https://docs.docker.com/engine/install/) - optional

Other dependencies have been included as gems and can be installed by running

```
$ bundle install
```


#### Configuration

This application depends on environment variables which have to be set. To add these variables set on development, create a file `config/application.yml` and set the required variables using the `config/sample_application.yml` as an example.

#### Database

No database is required as we simply fetch data from an API and display

#### Application setup
To support running on multiple platforms and make it production-ready, this application has been dockerized. However, Docker is optional to run locally.

##### Using Docker
If you have docker installed already, you can simply build and start this project using docker-compose. First check if you have Docker. Running the command below should return a version number.
```
$ docker -v
```
If you installed Docker Deskptop for Mac or Windows, the  `docker-compose` binary likely shipped with it. To verify, run:
```
$ docker-compose -v
```
If you do not have them installed (for example, Linux users with no desktop version), you might want to check out [this doc](https://docs.docker.com/compose/install/) for an installation guide.

If all is fine, we can set up and start this application by running:
```
$ docker-compose up
```
The first time, it would take some time as it does a one-time setup. When it finishes, you should see the Rails app running locally

#### Running the test suite

Tests have been included. To run these tests, run the command
```
$ bundle exec rspec
```
or with `docker-compose`,
```
$ docker-compose exec web rspec
```
