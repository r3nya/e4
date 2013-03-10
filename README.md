### e4

[![Code Climate](https://codeclimate.com/github/fat0troll/e4.png)](https://codeclimate.com/github/fat0troll/e4)

**e4** is a site engine, builded on Ruby on Rails force, replacement of Yads2 — old site engine inspired by linux.org.ru, used on xilitra.ru in 2012-2013.

##### Why e4 not Yads2?

* e4 is written on Rails;
* e4 have support for simple customization and adaptation for your site. No hardcoded parameters anywhere;
* e4 is awesome.

#### Installation for development

You need Rails (suddenly!) and something like RVM/Rbenv.

e4 installation for development && testing is very simple. Checkout this git, go to checkouted directory and run:

    bundle install --without production

This command installs all dependencies for development and testing.
Populate database with:

    rake db:migrate && rake db:seed

For registering users (and testing all users functional), in another terminal run

    mailcatcher

and go to http://127.0.0.1:1080/.

#### Deploying

This section isn't written yet.
