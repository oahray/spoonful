# Spoonful
[![Build Status](https://travis-ci.org/oahray/spoonful.svg?branch=main)](https://travis-ci.org/oahray/spoonful)


This is a simple project that consumes the [Content Delivery API](https://www.contentful.com/developers/docs/references/content-delivery-api/).

#### Ruby version

This project was developed with Ruby 3.0.0 (the latest ruby version at the time of development) and Rails 6.1.3.


#### System dependencies

-  [Ruby](https://www.ruby-lang.org/en/downloads/)
-  [Rails](https://github.com/rails/rails)
-  Bundler- (ships with Ruby)
-  [Docker](https://docs.docker.com/engine/install/) - optional (but recommended) on development

Other dependencies have been included as gems and can be installed by running

```
$ bundle install
```


#### Configuration

This application depends on environment variables which have to be set. To add these variables set on development, create a file `config/application.yml` and set the required variables using the `config/sample_application.yml` as an example. At the very least, these variables should be set:
- CONTENTFUL_SPACE_ID
- CONTENTFUL_ACCESS_TOKEN
- CONTENTFUL_ENVIRONMENT
- DEFAULT_PER_PAGE

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

#### Feature Development

The project uses [Rubocop](https://rubocop.org/) as a linter to enforce coding conventions, and [TravisCI](https://www.travis-ci.com/) is used for Continuous Integration.

Also, the application has been dockerized, as a [Docker](https://www.docker.com/) container would include everything (and only those things) the application would need to run, and it can easily be moved across environments with minimal configuration as long as the host machine can run docker.

The gem [contentful-rails](https://github.com/contentful/contentful_rails) was used as to fetch data from the [Contentful API](https://www.contentful.com/developers/docs/references/content-delivery-api/). The reason behind this choice is that the gem exposes classes and methods that helps use interact with our entries as if they were Rails ActiveRecord objects. Also, caching comes with it out of the box, although caching is still implemented at view level.

[Rspec](https://rspec.info/) was chosen as the testing framework of choice as it makes unit testing and integration testing (requests tests) seamless.

This first version (release) of the application has functionality to
- View a list of recipes. This page has pagination implemented, with default limit (per_page) set as an environment variable. Currently the user can set the the limit by setting `per_page` to the desired value as a url query parameter. That would then override the default value.
- View details of a recipe. This page is reached by clicking the view button on any recipe card on the recipes page. Here we can see the recipe image, tags, description and the name of the chef who prepared the mouth-watering delight.
