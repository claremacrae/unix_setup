#!/bin/sh

# Taken from http://www.webupd8.org/2013/05/tiny-tiny-rss-ubuntu-ppa-google-reader.html

# 1. install MySQL and Apache:
sudo apt-get install mysql-server mysql-client apache2 libapache2-mod-php5

# 2. To add our Tiny Tiny RSS PPA and install the latest TT-RSS in Ubuntu 13.04, 12.10 or 12.04,
# use the following commands in a terminal:

sudo add-apt-repository ppa:webupd8team/tt-rss
sudo apt-get update
sudo apt-get install tt-rss

# If this is a fresh installation, you'll be prompted to:
#   choose the database type: select MySQL;
#   choose the web server - select Apache2;
#   you'll need enter the full URL of you tt-rss installation 
#     (for instance "http://localhost/tt-rss/" for a local install).

# If later on you want to reconfigure tt-rss, you can run the following command:
# sudo dpkg-reconfigure tt-rss

# 3. This shouldn't be required anymore since TT-RSS should do this automatically 
# but just in case, run the following commands:
#sudo ln -s ../conf-available/50-tt-rss.conf /etc/apache2/conf.d/
#sudo service apache2 restart

# 4. The next step is to enter your server address under /etc/tt-rss/config.php 
# so open that file with a text editor as root - I'll use nano for the command below:
sudo nano /etc/tt-rss/config.php

# and in this file, scroll down to "define('SELF_URL_PATH', 
# 'http://yourserver/tt-rss/');" and replace "yourserver" with your server 
# address, or use "localhost" if you only plan on using it locally. Then 
# save the file and exit (to save and exit in Nano text editor, press: 
# CTRL + o, ENTER then CTRL + x ). 

# 5. To get Tiny Tiny RSS to update the feeds, you need to edit the 
# /etc/default/tt-rss file as root with a text editor - I'll use nano 
# command line text editor in the command below: 
sudo nano /etc/default/tt-rss

# and in this file, change "DISABLED" from "1" to "0", then save the 
# file and exit (to save an exit in Nano, press CTRL + o, ENTER then CTRL + x).

# And finally, start the Tiny Tiny RSS service:

sudo service tt-rss start

# You only need to run this command once, the tt-rss daemon should start 
# automatically on each system startup.

# 6. Now navigate to your server address (which you've set up under step 3 - e.g.:
# http://localhost/tt-rss/) and use the following to log in:

    # username: admin
    # password: password
# Then, change the password (!) and start importing your Google Reader feeds 
# or add some feeds manually.