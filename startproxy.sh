#!/bin/bash

/usr/local/bin/tesla-http-proxy -cert /config/tls.crt -tls-key /config/tls.key -host 0.0.0.0 -port 443 -key-file /config/private.pem -verbose
