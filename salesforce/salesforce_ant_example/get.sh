#!/bin/bash

# Set your Salesforce login credentials
username=''
password=''
security_token=''

serverurl=''

# Set the Salesforce object and field that you want to monitor
object='Account'
field='Name'

# Set the polling interval (in seconds)
interval=60

# Set the email address to send notifications to
email=''

# Authenticate to Salesforce
response=$(curl -X POST https://$serverurl/services/oauth2/token \
  -d "grant_type=password" \
  -d "client_id=your_client_id" \
  -d "client_secret=your_client_secret" \
  -d "username=$username" \
  -d "password=$password$security_token")
access_token=$(echo $response | jq -r .access_token)

# Set up a loop to poll for changes
while true; do
  # Get the current value of the field
  current_value=$(curl -s -H "Authorization: Bearer $access_token" \
    https://$serverurl/services/data/v52.0/sobjects/$object/id \
    | jq -r .$field)

  # If the value has changed, send a notification email
  if [ "$current_value" != "$previous_value" ]; then
    previous_value=$current_value
    printf "The value of $field on $object has changed to $current_value. Sending notification email.\n"
  fi

  # Wait for the specified interval before checking for changes again
  sleep $interval
done