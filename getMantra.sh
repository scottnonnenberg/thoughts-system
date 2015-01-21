# TODO: pull first arg if provided, use that for the mantras file
MANTRAS=info/mantras.txt
COUNT=`wc -l < ${MANTRAS}`
sed -n "`expr ${RANDOM} % ${COUNT} + 1`p" ${MANTRAS}
