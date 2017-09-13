# SLLA

A simple protest calendar for the Los Angeles area created in the LAMP stack. [Visit the site here.](http://stayloudla.com/)
Want to contribute? We have [Trello](https://trello.com/stayloudla)! Ask for an invitation in the Hack For LA Slack channel.

## Built With

* PHP
* jQuery
* [Facebook Open Graph](https://developers.facebook.com/docs/reference/opengraph/)

## Hosting locally
`php -S localhost:8000`

## Contributing
Check out our public [Trello Board](https://trello.com/b/jYpP8ZTg/stay-loud-la)
Pick up tasks in the `To Do` and let us know to update!

## Schema

**Users**

_id int(11) auto_increment

user text

pass text

level int(11)

iv text

**Calendar**

_id int(11) auto_increment

fb_id bigint(15)

published tinyint(1)

startTime datetime

lat double

lng double
