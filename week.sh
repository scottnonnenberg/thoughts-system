
set -e

# ensuring we're in the right directory
DIR=`dirname $0`
pushd ${DIR} > /dev/null

DATE_FORMAT=" -f %F"
PROVIDED_DATE=$1

# date doesn't like the f option provided if no date is provided as well
if [ -z "${PROVIDED_DATE}" ] ; then

DATE=`date -j -v-mon "+%Y-%m-%d"`

else

DATE=`date -j -v-mon ${DATE_FORMAT} ${PROVIDED_DATE} "+%Y-%m-%d"`

fi


DIR="`src/make_month_dir.sh ${DATE}`"

FILE_DATE=`date -j ${DATE_FORMAT} ${DATE} "+%Y%m%d"`

FILE="${DIR}${FILE_DATE}week.txt"
DAY="`date -j ${DATE_FORMAT} ${DATE} "+%A"`"
WEEKOF="Week of `date -j ${DATE_FORMAT} ${DATE} "+%Y/%m/%d"`"


# if the log file doesn't exist, we'll create it
if [ ! -f "${FILE}" ] ; then

# first add "week of" to the top
cat <<EOF > ${FILE}

${WEEKOF}

EOF

# then add template
cat info/templates/week.txt >> ${FILE}

fi


# open file if EDITOR is set
if [ ! -z "${EDITOR}" ] ; then

$EDITOR ${FILE}

else

echo "Set EDITOR environment variable to open file..."

fi


# returning you to wherever you were...
popd > /dev/null
