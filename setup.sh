#! /bin/bash

TOKEN=$(gcloud auth print-access-token)

apigeecli -t $TOKEN --org=$ORG kvms create --proxy=github-webhook-hmac --name=github-webhook-hmac
# {
#     "name": "github-webhook-hmac",
#     "encrypted": true,
#     "resourceName": ""
# }


apigeecli -t $TOKEN --org=$ORG kvms entries create \
    --proxy=github-webhook-hmac \
    --map=github-webhook-hmac \
    --key=webhook_secret \
    --value=your-github-webhook-secret
# {
#     "name": "webhook_secret",
#     "value": "your-github-webhook-secret"
# }


apigeecli -t $TOKEN --org=$ORG apis create bundle \
    --name=github-webhook-hmac \
    --desc="Web Hook for Git Repo (github-webhook-apigee-hmac) - supports both forms of requests x-www-form-urlencoded or json" \
    --proxy-folder=./apiproxy \
    --env=test --ovr --wait 

