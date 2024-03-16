#! /bin/bash
#generate rapports

set -o errexit	#abort on nonzero exitstatus
set -o nounset	#abort on unbound variable
set -o pipefail #don't hide errors within pipes

#variables
date=$(date '+%Y-%m-%d-%T')
vultekst='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vulputate ipsum quis accumsan gravida. Sed ornare auctor fringilla. In egestas sapien sem, at aliquam sapien auctor tristique. Curabitur id turpis ipsum. Vestibulum ac tellus vitae nisl aliquet interdum eu quis tortor. Quisque dolor quam, consectetur malesuada mi ac, fringilla faucibus ligula. Vestibulum sed ligula eros. Etiam in convallis augue. Sed fermentum commodo ultricies. Morbi commodo ullamcorper sagittis.'
display='graphs/'

#move previous rapports to a backup directory
mv rapport/rapportpdf.pdf rapport-backups/rapport_"${date}".pdf

#first graph
echo -e "# free capacity per parking\n" >"rapport/rapport.md"
echo '![Free capacity+total capacity]('$display'free_capacity_per_parking.png)' >>"rapport/rapport.md"
echo -e "\n${vultekst}\n" >>"rapport/rapport.md"


#2nd graph
echo -e "# free and total capacity per parking\n" >>"rapport/rapport.md"
echo '![Free capacity]('$display'total_and_free_capacity_per_parking.png)' >>"rapport/rapport.md"
echo -e "\n${vultekst}\n" >>"rapport/rapport.md"

#3th graph
echo -e "# Category of parking\n" >>"rapport/rapport.md"
echo '![Category]('$display'categorie_piechart.png)' >>"rapport/rapport.md"
echo -e "\n${vultekst}\n" >>"rapport/rapport.md"

#4th graph
echo -e "# Free capacity and occupation for parking Sint-Michiels\n" >>"rapport/rapport.md"
echo '![Free capacity+occupation]('$display'freecapacity_occupation.png)' >>"rapport/rapport.md"
echo -e "\n${vultekst}\n" >>"rapport/rapport.md"

#5th graph
echo -e "# Horizontal occupation per time Sint-Michiels\n" >>"rapport/rapport.md"
echo '![occupation per time]('$display'Hor_bars_occupation_Sint-Michiels.png)' >>"rapport/rapport.md"
echo -e "\n${vultekst}\n" >>"rapport/rapport.md"

#transform rapport in md format to pdf format
#markdown rapport/rapport.md > rapport/rapportpdf.pdf
pandoc "rapport/rapport.md" --pdf-engine=pdflatex -o "rapport/rapportpdf.pdf"
