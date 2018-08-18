PATH=$PATH:/root/.local/bin
stamp=$(date +%h-%d)
bucket=''
twilio_acct_sid=''
auth_token=''
tar --exclude='*.tar.bz' -cvjf /mnt/s3/$stamp.tar.bz /mnt
aws s3 cp /mnt/s3/$stamp.tar.bz s3://$bucket/$stamp-backup
curl 'https://api.twilio.com/2010-04-01/Accounts/$twilio_acct_sid/Messages.json' -X POST \
--data-urlencode 'To=' \
--data-urlencode 'From=' \
--data-urlencode 'Body=S3 backup complete' \
-u $twilio_acct_sid:$auth_token
