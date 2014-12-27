
# ensuring we're in the right directory
DIR=`dirname $0`
pushd ${DIR} > /dev/null

# adding all outstanding files
git add -A > /dev/null

# commit with an autocommit comment
git commit -m "autocommit for `date`" > /dev/null

# returning you to wherever you were...
popd > /dev/null
