#! /bin/bash

dig +short txt ch whoami.cloudflare @1.0.0.1 | tr -d '"'
