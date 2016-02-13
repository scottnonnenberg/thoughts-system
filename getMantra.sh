# TODO: pull first arg if provided, use that for the mantras file
MANTRAS=info/mantras.txt
COUNT=`wc -l < ${MANTRAS}`
SELECTED=`expr ${RANDOM} % ${COUNT} + 1`
sed -n "${SELECTED}p" ${MANTRAS}
