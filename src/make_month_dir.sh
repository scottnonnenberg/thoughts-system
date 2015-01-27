
set -e

DATE_FORMAT=" -f %F"
PROVIDED_DATE=$1

# date doesn't like the f option provided if no date is provided as well
if [ "${PROVIDED_DATE}" == "-v+mon" ] || [ -z "${PROVIDED_DATE}" ] ; then

DATE_FORMAT=""

fi

MONTH_DIR="`date -j ${DATE_FORMAT} ${PROVIDED_DATE} "+%Y"`/`date -j ${DATE_FORMAT} ${PROVIDED_DATE} "+%m"`_`date -j ${DATE_FORMAT} ${PROVIDED_DATE} "+%B"`/"

# making this month's directory if it doesn't exist
if [ ! -d "${MONTH_DIR}" ] ; then

mkdir -p ${MONTH_DIR}

fi

echo ${MONTH_DIR}
