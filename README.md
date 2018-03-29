# SLLA

A simple protest calendar for the Los Angeles area. [Visit the site here.](http://stayloudla.com/)
Want to contribute? We meet every Wednesday night! Ask for an invitation in the Hack For LA Slack channel.

## Contributing to this Project
There are several major ways you can contribute to this project!

### Everyone!
Whether you're a developer, designer, both, neither, etc, you can contribute by checking out the [question](https://github.com/seport/SLLA/issues?q=is%3Aissue+is%3Aopen+label%3Aquestion) tag! These are non-technical issues about the direction of the app. We want your input! Please provide your opinions by commenting on the issue at hand.

### Designers
If you are a designer, we need designs! Check out the [needs design](https://github.com/seport/SLLA/issues?q=is%3Aissue+is%3Aopen+label%3A%22needs+design%22) tag in the issues, and wireframe or mockup to your heart's content!

### Developers
If you are a developer, follow the local development setup instructions below, and pick up a ticket from the To Do section of the [project board](https://github.com/seport/SLLA/projects/1).

### Project Managers
I need your help! Just come talk to us at the hack night.

## Setting Up For Local Development

## Cloning this repo
1. Fork the repo
1. Clone your forked repo

    `git clone -b rails https://github.com/<YOUR USERNAME>/SLLA.git`

1. Navigate to the SLLA folder

    `cd SLLA`

1. Add a new upstream remote to the original repo

    `git remote add upstream https://github.com/seport/SLLA.git`
    
1. Checkout the `rails` branch

    `git checkout --track origin/rails`
## Pulling From This Repository
1. When you need to pull code from this repository, do it like this!

    `git fetch upstream`
    
    `git merge upstream/<BRANCH NAME>`

## Connecting to the facebook API
Because we use the facebook open graph API to pull event data, you'll need to add a facebook token to the app for local development.

1. [Follow these instructions to create a facebook app of your own.](https://developers.facebook.com/) (Choose "Website" for platform)
1. Find your app id and app secret on your app's dashboard.
1. Edit your .env file with the following:

    `FB_TOKEN=<APP ID>|<APP SECRET>`

## Option 1: Setting up to run in docker
1. Install docker [for OSX](https://docs.docker.com/docker-for-mac/install/) or [for windows](https://www.docker.com/docker-windows)
1. Run docker file (via command line)
    1. To run interactive: docker run -it -p 3000:3000 -v path/to/SLLA:/app:rw chrisdower/slla:latest
    1. To run detached: docker run -d -p 3000:3000 -v path/to/SLLA:/app:rw chrisdower/slla:latest
1. The site can be accessed at localhost:3000
## Option 2: Setting up locally without Docker
1. If you don't have Ruby already installed (IE you are not on a mac), install Ruby 2.4
1. Install Rails 5.1.4+
1. Navigate to the SLLA folder
1. Run `bundle install`
1. Run the migrations.
    
    `rake db:migrate`

1. Run your server.

    `bin/rails server`

1. Navigate to `localhost:3000` in your browser. You should see the homepage!
