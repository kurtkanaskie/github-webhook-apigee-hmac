# github-webhook-apigee-hmac

Apigee X proxy to test webhooks with HMAC validation

Set env variables:
```
ORG=your_org
ENV=your_env
HOST=your_host
```

Run the setup.sh script to install and deploy in your $ORG and $ENV

Create webhook in github pointing to https:${HOST}//github-webhook-hmac for either form-url-encoded or JSON format

