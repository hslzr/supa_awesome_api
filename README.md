# Supa Awesome Api

Basic API example for Hacker School.

# Getting started

## Requirements
This application assumes you have at least Ruby and other dependencies to run.
If that is not the case you can use [kaishi] to install everything you need.

[kaishi](https://github.com/IcaliaLabs/kaishi)

Also, this application contains a .ruby-version file in case you use rbenv

## Dependencies
- Ruby 2.2.3
- Rails 4.2.6

### Development

This application uses the api subdomain , you may need [Pow](http://pow.cx/) (for mac) || [Prax](https://github.com/ysbaddaden/prax) (linux) to run your application.

link your app with ```supa-awesome.dev```

Prax Guide:
http://ysbaddaden.github.io/prax/

For Mac OS X:

```
$ gem install powder
$ powder link awesome
```

In order to watch development.log run:

```% tail -f log/development.log```

Restarting the app:

```% touch tmp/restart.txt```
