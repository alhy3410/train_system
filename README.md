# train_system

#Author Name: Andrew Lee
#Program Name: train_system
#Description: This program will allow users to create a system whre they can add trains as well as cities and connect them to each other.  It incorporates databases as well as CRUD functionality.
#Setting up the database:
<p>In psql type(press return after each step):
<ol>
<li>CREATE DATABASE trains_system;</li>
<li>CREATE TABLE trains (id serial PRIMARY KEY, train_name varchar);</li>
<li>CREATE TABLE cities (id serial PRIMARY KEY, cities_name varchar);</li>
<li>CREATE TABLE stops (id serial PRIMARY KEY, trains_id int, cities int);</li>
<li>CREATE DATABASE trains_system_test WITH TEMPLATE trains_system;</li>
</ol>

#Set-up instructions:
<p>All gems in Gemfile must be bundled and a Gemfile.lock file created prior to running this app.</p>
<ol>
<li>Go to www.github.com/andrewlhy</li>
<li>Check the repositories tab and locate the "trains_system" project folder</li>
<li>In the right hand column it will say "HTTPS clone URL, click on the clipboard icon below that</li>
<li>Enter your terminal, change to Desktop directory, in command line: cd Desktop</li>
<li>Into the command line type: git clone (copy and paste the clone URL) train_system</li>
<li>This will create a folder on your desktop called "trains_system" holding the project folders and files</li>
<li>Change directory to trains_system: cd trains_system</li>
<li>Download and install bundler</li>
<li>To gain access to the proper versions of gems, in the command line run: bundle</li>
<li>To initiate a sinatra session, in the command line type: ruby app.rb</li>
<li>In browser enter: localhost:4567 to run the app locally and follow on screen instructions</li>
<li>Follow the onscreen instructions to begin creating your very own trains_system!</li>
</ol>
</p>
#Bug reports: <p>There are currently no known bugs to this program.  Any discovered bugs should be reported
directly to the programs creator at andrewlhy@gmail.com</p>
#Licenses and Copywright info: <p>andrewlhy License.  Copyright 2015 andrewlhy industries.</p>
