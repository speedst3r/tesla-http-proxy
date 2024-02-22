# tesla-http-proxy

This repo contains a Dockerfile to build and run the Tesla REST API Proxy. It requires a private key (linked to your app with public key published) and a TLS certificate and key. Please refer to the [vehicle-command](https://github.com/teslamotors/vehicle-command) repository for more details.

The built container listens on port 443 and expects the following to be mounted:

| Mount | Description |
| :---- | --- |
| /config/tls.crt | TLS certificate chain for HTTPS endpoint |
| /config/tls.key | TLS private key for HTTPS endpoint |
| /config/private.pem | Tesla app private key |

This container listens on all IPs and has no authentication of its own - *you must use a reverse proxy with authentication* to prevent abuse and your Tesla developer app being blocked.

This is for personal/proof-of-concept use and has not been extensively tested - you accept you use this at your own risk.

## requirements

- Tesla developer account (https://developer.tesla.com)
- Third-party application active in your Tesla developer account
- Docker 


## Installation
To use this as a docker container, you will have to build it with the included Dockerfile

## validate

if it's running properly you should get an OAuth client error when browsing to

http://IP_ADDRESS/api/1/randomEndpoint
