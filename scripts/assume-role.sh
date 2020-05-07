#!/usr/bin/env bash

temp_role=$(aws sts assume-role --role-arn ${terraform_role_arn} --role-session-name alfresco-proxy-temp-ci-session --duration-seconds 900)

export AWS_ACCESS_KEY_ID=$(echo ${temp_role} | jq .Credentials.AccessKeyId | xargs)
export AWS_SECRET_ACCESS_KEY=$(echo ${temp_role} | jq .Credentials.SecretAccessKey | xargs)
export AWS_SESSION_TOKEN=$(echo ${temp_role} | jq .Credentials.SessionToken | xargs)

aws sts get-caller-identity