
set -e

# ensuring we're in the right directory
DIR=`dirname $0`
pushd ${DIR} > /dev/null

# TODO: combine -v+mon with a user-provided date

DIR="`src/make_month_dir.sh '-v+mon'`"
DATEFORMAT=`date -j -v+mon "+%Y%m%d"`
FILE="${DIR}${DATEFORMAT}week.txt"
DAY="`date -j -v+mon "+%A"`"
WEEKOF="Week of `date -j -v+mon "+%Y/%m/%d"`"


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
