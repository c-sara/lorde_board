# lorde_board

## The Lorde Board
### Accessing the site

Access via: https://lorde-board.herokuapp.com/login 

![lorde-forum-screenshot](/resources/lorde-forum-screenshot.png "Lorde Forum Screenshot")

To try the site, create a new account or login with the details below:
Email: guest@guest.com
Password: 123

## Features
This is a full-stack application celebrating the artist, Lorde. 

The features include:
* A sign up/log in functionality with encryped passwords and an authorisation flow
    * Users are only allowed into the site if they have an account
    * A databse is used to store user information - passwords are encrypted once users have signed up
* CRUD functionality
* RESTful routes used
* Users have the ability to do the following:
    * Create, read, update and delete posts
    * Create, read, update and delete comments

## Technologies Used
Languages used:
* Ruby
* HTML
* CSS
* SQL

Database used:
* PostgreSQL

Libraries used:
* Sinatra
* BCrypt

## Approach Taken
### Planning
Before making a start on the project, I had drafted up a plan and wireframe.

![project-plan](/resources/project-plan.jpg "Project Plan")

![project-wireframe](/resources/project-wireframe.jpg "Project Wireframe")

The theme came easily as Lorde's third album was released recently. She has been my top artist on Spotify since 2017 and I thought it would be fun to incoporate her as the main theme of this project.

### Lessons learnt
Keep on testing bugs throughout the project. I left some testing to the end as I had assumed it was running fine. 

## Unsolved Problems
There were time contraints with my project, I would like to incorporate the following when I get the chance:
* If the title is left blank in a new post, there will be an issue accessing it on the home page. 
    * Solution: Add in an if statement to ensure a user will not be able to create/update a post without it.
* The user will be able to update details in their account

## Sources
Images/resources
* https://lordegallery.tumblr.com/ 
* https://www.reddit.com/r/lorde/


