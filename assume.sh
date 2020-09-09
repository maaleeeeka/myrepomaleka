#!/bin/bash

unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_DEFAULT_REGION AWS_SESSION_TOKEN

credsOut=$(aws --profile 312 sts assume-role \
  --role-arn arn:aws:iam::401413892014:role/DevopsAccessRole2020B \
  --role-session-name kube-class)

region=us-east-1
accessKey=$(echo $credsOut | jq -r '.Credentials.AccessKeyId')
secretKey=$(echo $credsOut | jq -r '.Credentials.SecretAccessKey')
sessionToken=$(echo $credsOut | jq -r '.Credentials.SessionToken')

export AWS_ACCESS_KEY_ID=$accessKey
export AWS_SECRET_ACCESS_KEY=$secretKey
export AWS_DEFAULT_REGION=$region
export AWS_SESSION_TOKEN=$sessionToken
