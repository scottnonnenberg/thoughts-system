
set -e

# ensuring we're in the right directory
DIR=`dirname $0`
pushd ${DIR} > /dev/null


MONTH_DIR="`src/make_month_dir.sh`"
DATEFORMAT=`date "+%Y%m%d"`
FILE="${MONTH_DIR}${DATEFORMAT}log.txt"
DAY="`date "+%A"`"


# if the log file doesn't exist, we'll create it
if [ ! -f "${FILE}" ] ; then

# first add day to the top
cat <<EOF > ${FILE}
${DAY}

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
