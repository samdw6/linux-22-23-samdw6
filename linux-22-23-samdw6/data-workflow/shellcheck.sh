#! /bin/bash

bash -n data.sh
bash -n transform.sh
bash -n rapport.sh
bash -n automation.sh

shellcheck data.sh
shellcheck transform.sh
shellcheck rapport.sh
shellcheck automation.sh
