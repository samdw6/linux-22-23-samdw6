#! /bin/bash

set -o errexit    #abort on nonzero exitstatus
set -o nounset    #abort on unbound variable
set -o pipefail   #don't hide errors within pipes

# execute scripts

#gather raw data as json
bash ./data.sh
#transform raw data to csv
bash ./transform.sh

# Perform the python scripts
python3 analyse-csv.py
#python3 all_data_chart.py
python3 allDataChart.py
#make rapport
bash ./rapport.sh
