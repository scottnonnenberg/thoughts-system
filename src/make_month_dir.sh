
set -e

ARGS=$1
MONTH_DIR="`date ${ARGS} "+%Y"`/`date ${ARGS} "+%m"`_`date ${ARGS} "+%B"`/"

# making this month's directory if it doesn't exist
if [ ! -d "${MONTH_DIR}" ] ; then

mkdir -p ${MONTH_DIR}

fi

echo ${MONTH_DIR}
