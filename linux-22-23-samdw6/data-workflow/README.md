# Required packages

1. sudo apt install python3

2. sudo apt install python3-pip

3. sudo apt install python3-numpy

4. sudo apt install python3-matplotlib

5. sudo apt install python3-pandas

6. sudo apt install curl

7. sudo apt install jq

8. sudo apt install texlive-latex-extra

9. sudo apt install textlive-latex-base

10. sudo apt install pandoc

11. sudo apt install git

12. sudo apt install shellcheck



# Required VSCode extensions

- markdown preview enhanced

- vscode-pdf

- python



# How to run

- open command prompt (ctrl + alt + t)

- change directory to linux-22-23-samdw6/data-workflow/ (cd linux-22-23-samdw6/data-workflow)

- run automation script to run all the files at once (./automation.sh)

- to view the results open VSCode (code .)

- open the map rapport and press on rapportpdf.pdf



# Usage of scripts

## Script 1

The data.sh script is used to gather raw data from the datastadgent website through an API. To gather the data I use a curl commando toghether with jq. There are some variables made to give a better overview over the code. The raw data that is gathered is put in a json file with a timestamp from the moment the script was ran.

## Script 2

In the transform.sh file we transform the JSON file to a CSV file. Herefore we use a jq command. In this jq commando we say which data we specifically want to transform and which ones we can leave out.

## Script 3

this is a python file in which we make our charts with the data from the csv file.

To get the newest csv file i make a variable latest file.

next up I made a dataframe with the data I want to use from the csv file. After this the data is converted with numpy so it can be used in the charts. 

To make the charts I used matplotlib and pandas.

## Script 4
This is another python file in which I made graphs with all the data from the csv files.

## Script 5

In rapport.sh I make sure to save my old rapports to an other folder with the mv command. After I print all the text and graphs into a rapport.md file which we later convert into a pdf file by using pandoc.

## Script 6

This script is strictly written to run all the scripts above at once instead of running them all separately. 

## Script 7

The shellcheck.sh script is used to check if the scripts are written correctly. This is done by using the shellcheck command. This command checks if the scripts are written correctly and if there are any errors in the scripts.