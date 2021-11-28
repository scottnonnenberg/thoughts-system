
set -e

# ensuring we're in the right directory
DIR=`dirname $0`
pushd ${DIR} > /dev/null

DATE_FORMAT=" -f %F"
PROVIDED_DATE=$1

# date doesn't like the f option provided if no date is provided as well
if [ -z "${PROVIDED_DATE}" ] ; then

DATE_FORMAT=""

fi

MONTH_DIR="`src/make_month_dir.sh ${PROVIDED_DATE}`"
DATE_STRING=`date -j ${DATE_FORMAT} ${PROVIDED_DATE} "+%Y%m%d"`
DATE_FOR_DAY=`date -j ${DATE_FORMAT} ${PROVIDED_DATE} "+%B %d"`
FILE="${MONTH_DIR}${DATE_STRING}log.txt"
DAY="`date -j ${DATE_FORMAT} ${PROVIDED_DATE} "+%A"`"
MANTRA=`./getMantra.sh`

# if the log file doesn't exist, we'll create it
if [ ! -f "${FILE}" ] ; then

# first add day to the top
cat <<EOF > ${FILE}
${DAY}, ${DATE_FOR_DAY}

Today's mantra: ${MANTRA}

EOF

# then add template
cat info/templates/day.txt >> ${FILE}

fi


# open file if EDITOR is set
if [ ! -z "${EDITOR}" ] ; then

$EDITOR ${FILE}

else

echo "Set EDITOR environment variable to open file..."

fi


# returning you to wherever you were...
popd > /dev/null
