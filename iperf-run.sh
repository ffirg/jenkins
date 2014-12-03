#!/bin/bash

#
# simple script for running iperf NIC tests
#

# get config settings from here...
. /etc/sysconfig/iperf

# setup client if set
if [ ${IPERF_CLIENT_NODE} = "1" ]
then
  # if we want logging use this command line...
  if [ ${IPERF_LOGGING} = "1" ]
  then
    iperf -c ${IPERF_SERVER} -p ${IPERF_PORT} -o ${IPERF_LOG} ${IPERF_ARGS}
  else
    # otherwise no logging
    iperf -c ${IPERF_SERVER} -p ${IPERF_PORT} ${IPERF_ARGS}
  fi
fi

# setup server if set
if [ ${IPERF_SERVER_NODE} = "1" ]
then
  nohup iperf -s >/dev/null &
fi
