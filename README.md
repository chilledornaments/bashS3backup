# bashS3backup
Simple script to dump a .bz (or whatever you want, really) to S3.

I run a samba server off a Raspberry Pi that my machines dump configs and other pain-in-the-ass-to-set-up-again to. Every month, I tar the entire /mnt directory up (backups excluded) and pop it into S3 where it sits for 31 days before moving to Glacier. When the backup is done, I get a text message. 

Backups stay locally on `/mnt/s3/` as well. 

## Getting Started
Create an S3 bucket. 

Create a programmatic access IAM user that has permissions to write to just that bucket. Copy the access and secret keys.

Create a bucket access policy that allows just that user to putObject on bucket/*. 

Download and install the AWS CLI. 

Run `aws configure` and provide the keys you generated. 

## Variables
`bucket` is the S3 bucket you're uploading to. 

`twilio_acct_sid` is, well, your Twilio account SID. 

`auth_token` is your Twilio auth token.

## To and From Numbers
Fill these in on your own. You'll need to preface them with `+` and the country code (i.e. +11231231234)
