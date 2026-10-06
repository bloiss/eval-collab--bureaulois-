#!/bin/bash
certbot renew
nginx -s reload
