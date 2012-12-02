#Getting Started#
## Aim ##
  Give future and potential invstg8net rhokers a short summery and trial and 
  error approach to get them going quickly.
  
## Audience ##
  Future rhokers who may not have worked with ruby on rails before (like myself).
  If you are an experienced ruby developer some of this is likely obvious.
  
## Configuring Ruby and Rails ##
  Do not try to do this on natively on Windows...
  therubyracer gem which is used is not supported on windows.  Cygwin also encountered 
  issues, I recommend that if you are on windows, install virtualbox and the latest ubuntu image.

  Find a tutorial for installing ruby and rails on ubuntu, and follow the steps.
  
  There are some good tutorials on building a rails restful api as well, if not 
  familiar with ruby, its probably worthwhile to read those now and maybe do a 
  sample app locally.

## Configuring the Databases ##
  For local development, you can use the default embedded database sqlite3.
  However, on the host you will need to move to either postgresql or mysql.
  postgresql is the default on heroku (likely the easiest option for configuration)
  In your local environment you can install both along with their development
  packages.  Again google for tutorials on installing these, in particular postgresql
  needs a few configuration steps before it will work locally.
  I found this hopeful, http://xtremekforever.blogspot.ca/2011/05/setup-rails-project-with-postgresql-on.html
  but you should google around if there is something more current.

## Changing Databases in your Rails Project ##
  In your Gemfile include the one corresponding to the database you are using.
    i.e. sqlite, pg, mysql
  Edit config/database.yml to match your local database configuration.  
  For postgresql or mysql that means mathcing user and password with the
  ones used when you were configuring the database.
  Then update to the new database, from rails project_root:
     project_root$ rake db:create
	 project_root$ rake db:migrate
  The migrate command builds all the tables your application will need.
  At this point,
     project_root$ rails s
  will start your server locally, so you can experiment with it.

## Running on Heroku ##
  You will have to make an account, this is free.
  Heroku uses postgresql by default so the easiest is to get postgresql running locally and
  then follow the heroku getting started guide to migrate your project.  
  At time of writing they provide a simple method of getting a rails project live.
    https://devcenter.heroku.com/articles/rails3
  A few things to note, we were not able to get this working because of a network issue.
  To run the $rake db:migrate command on heroku, you need to use the heroku toolbelt.
  Unfortunately the toolbelt only listens on port 5000, which is a common port to be
  blocked in corporate environments.
    https://devcenter.heroku.com/articles/oneoff-admin-ps

## Running on Other Hosting ##
  We tried running our project through an apache host using the fast cgi 
  interface.  Only the basic page would display, we couldn't get any of the
  generated resources to display.  An experienced developer could probably help 
  here.
  
## Twilio Interface ##
  We never got the server live, so didn't test this.  I am not sure if the
  restful interface is implemented or not, I think it is, but you will have to
  explore this.
  
## Ruby Application Overview ##
    project_root$ rake routes will list the pages you can look at.
  The scaffolding is questions and answers, if you enter a question
    http://0.0.0.0:3000/questions
  should give a form to enter questions and
    http://0.0.0.0:3000/admin/questions
  will list the questions stored so far into the database.
  The admin password and login is hardcoded into 
    project_root$ app/controllers/admin/base_controller.rb
	<login="admin",password="rhok-toronto-2012">
	
## Frontend Application ##
  The frontend application consists of a webpage for submitting help requests.
  Done with ASP.net & C#. Uses a mySql database.
  Simple front end form that can be used to submit requets.
  Currently the form can pull field headings from the database.
  
  No error checking done currently.
  
  Next steps would be to capture data entered on the form and insert it into the database "request" table
    
  An admin tools to view submitted requets. Also pages for the admin to be able to edit field headings.
  example... Risk level categories needs to be developed... so we need a page to be able to edit the database...
  
  mySQL database root  / root pwd = root
  


  