#! /bin/bash
#gahter data with API

set -o errexit	#abort on nonzero exitstatus
set -o nounset	#abort on unbound variable
set -o pipefail #don't hide errors within pipes

#logfile
LOGFILE=./logs/logs.txt


#variables
date=$(date '+%Y-%m-%d-%T')
url='https://data.stad.gent/api/records/1.0/search/?dataset=bezetting-parkeergarages-real-time&q=&facet=name&facet=lastupdate&facet=description&facet=categorie'
output='./data/'$date'.json'


#curl command
#curl -o "${output}"  "$url" | jq ".records" ${output} 2>> $LOGFILE


curl "$url" | jq ".records" > "${output}" 2>> $LOGFILE
