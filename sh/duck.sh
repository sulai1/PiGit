#!/bin/bash
#Update the ip at duckdns
echo url="https://www.duckdns.org/update?domains=sulai&token=d35e8535-dbd4-40d9-8a3a-3f6bbfd28586&ip=" | curl -k -o ~/log/duck.log -K -
