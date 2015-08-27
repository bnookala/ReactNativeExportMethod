
# Our JavaScript is stored in the $PROJECT_ROOT/ReactComponents directory.
PATH=/usr/local/bin:$PATH
JS_DIR=`pwd`

# Finds the React root.
cd ../Pods/React
npm run start -- --root $JS_DIR
