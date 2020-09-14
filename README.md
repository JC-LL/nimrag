# nimrag
Short Ruby script for garmin connect upload from my Forerunner 305 from Linux.

## what is it ?
Nimrag is a small script that :
- retrieve *gmn data from Garmin forerunner 305
- convert the gmn data to gpx format
- maintains an history of files previously uploaded in Garmin connect, _via this script_


**warning** : this script may cause loss of data on Garmin connect web site. The info written by your own means will be erased.

Most of the job is done by Python garmin-uploader

## install
- sudo apt-get install garmin-forerunner-tools
- pip install garmin-uploader --user
- git clone https://github.com/JC-LL/nimrag

## configure
- nimrag uses a python script (garmin-uploader) that uses your credentials to connect to Garmin.
- garmin-uploader resorts to a configuration file named .guploadrc generally located at your home root.
- You need to write your own .guploadrc file

      [Credentials]
      username=your_username
      password=your_password


## running
- connect your Forerunner to USB
- cd where_ou_cloned_nimrag
- ruby nimrag.rb will do the job
