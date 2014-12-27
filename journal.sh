
set -e

# ensuring we're in the right directory
DIR=`dirname $0`
pushd ${DIR} > /dev/null


MONTH_DIR="`src/make_month_dir.sh`"
DATEFORMAT=`date "+%Y%m%d"`
FILE="${MONTH_DIR}${DATEFORMAT}.txt"
TIME="`date "+%I:%M"``date "+%p" | tr [:upper:] [:lower:]`"
DAY="`date "+%A"`"


# if the journal file doesn't exist yet, we'll create it
if [ ! -f "${FILE}" ] ; then

cat <<EOF > ${FILE}
${DAY}

Start: ${TIME}
End:

EOF

fi


# open file if EDITOR is set
if [ ! -z "${EDITOR}" ] ; then

$EDITOR ${FILE}

else

echo "Set EDITOR environment variable to open file..."

fi


# returning you to wherever you were...
popd > /dev/null
