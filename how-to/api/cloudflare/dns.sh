#!/bin/bash

#
# Simple script to add or delete DNS entries
#  -> Not proxied, not cached, just plain DNS entry as CNAME of main domain
#

export cloudflare_account=
export cloudflare_key=
export cloudflare_zoneid=
export dnshost=$2
export cloudflare_entryid=$2

function zoneGet(){
    curl -X GET "https://api.cloudflare.com/client/v4/zones/$cloudflare_zoneid/dns_records" \
     -H "X-Auth-Email: $cloudflare_account" \
     -H "X-Auth-Key: $cloudflare_key" \
     -H "Content-Type: application/json" | jq
}

function dnsAdd(){
    curl -sX POST \
    https://api.cloudflare.com/client/v4/zones/$cloudflare_zoneid/dns_records \
    -H "Content-Type: application/json" \
    -H "X-Auth-Email: $cloudflare_account" \
    -H "X-Auth-Key: $cloudflare_key" \
    -d '{"type":"CNAME", "name":"'$dnshost'", "content": "@", "proxied": false}' | jq
}

function dnsDelete(){
    curl -sX DELETE \
    https://api.cloudflare.com/client/v4/zones/$cloudflare_zoneid/dns_records/$cloudflare_entryid \
    -H "X-Auth-Email: $cloudflare_account" \
    -H "X-Auth-Key: $cloudflare_key" | jq
}

$1