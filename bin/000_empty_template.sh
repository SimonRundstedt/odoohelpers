#!/bin/bash
################################################################################
# Template script
################################################################################

echo "Moved functionality to own file. Not tested yet. Exiting..."
exit 1
##
synopsis (){
  echo "A sentence of the purpose"
}
usage(){
  echo "Usage: $0 [flags]"
}

## Test if conf exist so we don't garble stuff
if [ -f _ODOOTOOLS_CONF ];
then
  source _ODOOTOOLS_CONF
else
  echo "Configuration _ODOOTOOLS_CONF not found"
  exit -1
fi
##
##
exit 0 # Success
