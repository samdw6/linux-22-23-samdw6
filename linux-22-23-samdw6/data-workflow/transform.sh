#! /bin/bash
#transform json file data to csv file

set -o errexit #about on nonzero exitstatus
set -o nounset #abort on unbound variable
set -o pipefail #don't hide errors within pipes

#variables
#date=$(date '+%Y-%m-%d-%T')

naam='parkeergegevens_'$(date '+%Y-%m-%d-%T')
outgoing='csv-data'
latestFile="data/$(ls data -rt | tail -n1)"


#setting headers
 echo "recordid,occupation,open,operatorinfo,freecapacity,description,lastupdate,name,openingtimedescription,type,categorie,totalcapacity,freeparking" > ${outgoing}/"${naam}".csv



#getting newest created json file
#CURRENT_DIR='data'

#get_recent_file () {
    #FILE=$(ls -Art1 ${CURRENT_DIR} | tail -n 1)
    #if [ ! -f ${FILE} ]; then
     #   CURRENT_DIR="${CURRENT_DIR}/${FILE}"
    #    get_recent_file
   # fi
  #  echo $FILE
 #   exit
#}
#get_recent_file



#transforming data with jq

jq -r '.[] | [.recordid, .fields.occupation, .fields.isopennow, .fields.operatorinformation, .fields.availablecapacity, .fields.description, .fields.lastupdate, .fields.name, .fields.openingtimesdescription, .fields.type, .fields.categorie, .fields.totalcapacity, .fields.freeparking] | @csv' "${latestFile}"  >> ${outgoing}/"${naam}".csv



#jq -r ' .[].fields' "data/2022-11-16-20:09:03.json" >> ${outgoing}/${naam}.csv 
 #jq --raw-output ' .[].recordid, .[].fields.occupation, .[].fields.isopennow, .[].fields.operatorinformation, .[].fields.availablecapacity, .[].fields.description, .[].fields.lastupdate, .[].fields.name, .[].fields.openingtimesdescription, .[].fields.type, .[].fields.categorie, .[].fields.totalcapacity, .[].fields.freeparking ' "data/2022-11-16-20:09:03.json"  >> ${outgoing}/${naam}.csv
#jq -r 'map({recordid, occupation, isopennow, operatorinformation, availablecapacity, description, lastupdate, name, openingtimedescription, type, categorie, totalcapacity, freeparking}) | (first | keys_unsorted) as $keys | map([to_entries[] | .value]) as $rows | $keys,$rows[] |@csv' "data/2022-11-16-20:09:03.json"  >> ${outgoing}/${naam}.csv
#cat data/2022-11-16-20\:09\:03.json | jq '.[].fields.occupation, .[].fields.totalcapacity'
#jq -r '.records | .[1]' data/2022-11-15-13:44:56.json

