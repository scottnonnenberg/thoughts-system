
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

YEAR="`date ${DATE_FORMAT} ${PROVIDED_DATE} "+%Y"`"
MONTH="`date ${DATE_FORMAT} ${PROVIDED_DATE} "+%B"`"
MONTH_NUMBER="`date ${DATE_FORMAT} ${PROVIDED_DATE} "+%m"`"
MONTH_DIR="`src/make_month_dir.sh` ${PROVIDED_DATE}"

FILE="${MONTH_DIR}${YEAR}${MONTH_NUMBER}review.txt"


# if the review file doesn't exist yet, we'll create it
if [ ! -f "${FILE}" ] ; then

# first add month to the top
cat <<EOF > ${FILE}
${MONTH} ${YEAR} Review

EOF

# then add template
cat info/templates/month.txt >> ${FILE}

fi


# open file if EDITOR is set
if [ ! -z "${EDITOR}" ] ; then

$EDITOR ${FILE}

else

echo "Set EDITOR environment variable to open file..."

fi


# returning you to wherever you were...
popd > /dev/null
