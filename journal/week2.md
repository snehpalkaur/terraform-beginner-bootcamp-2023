# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

It is a package manager for Ruby. It is a primary way to install Ruby packages (known as Gems) for Ruby

#### Install Gems

You need to create a GemFile and define your Gems in that file.

```rb
# frozen_string_literal: true

source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

After that - you need to run the `bundle install` command. This will intall the Gems on the system globally(Unlike node js which installs packages which install packages in a place in a folder called `node_modules`)

A `Gemfile.lock` file will be created to lock down the Gem versions being used in this project

#### Executing Ruby Scripts in the context of bundler

We have to use `bundle exec` to tell future Ruby Scripts to use the Gems we installed. This is the way we set context.

### Sinatra (https://sinatrarb.com/)

Sinatra is a micro web-framework for ruby to build web apps. 
Its great for mock or development servers or very simple projects.

You can create a web-server in a single file.

## Terratown Mock Server

### Running the web server

We can run the web server by executing the following commands:-

```rb

bundle install
bundle exec ruby server.rb

```
All of the code for our server is stored in the `server.rb` file.