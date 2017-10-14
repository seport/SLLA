# SLLA

A simple protest calendar for the Los Angeles area created in the LAMP stack. [Visit the site here.](http://stayloudla.com/)
Want to contribute? We have [Trello](https://trello.com/stayloudla)! Ask for an invitation in the Hack For LA Slack channel.

## Built With

* PHP
* jQuery
* [Facebook Open Graph](https://developers.facebook.com/docs/reference/opengraph/)

## Contributing
Check out our public [Trello Board](https://trello.com/b/jYpP8ZTg/stay-loud-la)
Pick up tasks in the `To Do` and let us know to update!

## Setting Up For Local Development
1. Install PHP 5.6.31, Apache 2.4.26, and MySQL 5.0.85
    * I recommend using XAMPP to manage your stack instead of installing these individually.
    * [You can install XAMPP 5.6.31 here](https://www.apachefriends.org/download.html)
2. Navigate to the `htdocs` folder and clone the repo

    `cd path/to/htdocs`

    `git clone https://github.com/seport/SLLA.git`
    
    * Make sure the files were saved in a folder called `SLLA` in the `htdocs` folder.
3. Run your server.
    * If you've installed XAMPP you can do this from the XAMPP control panel.
4. Navigate to `localhost:<PORT>/SLLA`. You should see the homepage.


### Set Up The Database
1. Navigate to localhost:<PORT>/phpmyadmin
2. Click on Databases and create one called `SLLA`.
3. Navigate to the SQL panel for your newly created database.
4. Run the scripts in the [db folder](/db) against your database.
    * You can do this simply by copy and pasting the code in the db script into the textbox on the page.
5. Verify that the host, username, password, and database in your dbconfig file match what's in your phpmyadmin panel, and make sure that the given user has read and write access to the database.
5. Navigate to `localhost:<PORT>/SLLA/admin`. You should now be able to log in as
    
    user: guest
    
    password: password
