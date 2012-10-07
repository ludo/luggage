#!/usr/bin/env bash

# This script is for my QNAP TS-112 NAS. It sends an email to the address
# configured in nas admin whenever IP has changed (to be scheduled as cron job)

USER="me@ludo.is"
IPFILE=$HOME/.ipwatchdog

if [ ! -e "$IPFILE" ]; then
  touch $IPFILE
fi

CURRIP=$(curl -s http://automation.whatismyip.com/n09230945.asp)
PREVIP=$(cat $IPFILE)

if [ "$CURRIP" != "$PREVIP" ]; then
  echo "$CURRIP" > $IPFILE
  echo "External IP changed, notifying Ludo..."

  # exec > /tmp/ipwatchdog.$$

  # echo "From: abacus@ludo.is"
  # echo "To: $USER"
  # echo "Subject: ALERT External IP home.cubicphuse.nl changed"
  # echo ""
  # echo "IP changed from $PREVIP to $CURRIP."

  # /usr/sbin/sendmail $USER < /tmp/ipwatchdog.$$

  /sbin/send_alert_mail "Hi there! Wanted to let you know that the external IP changed from $PREVIP to $CURRIP. Have a nice day."
  rm /tmp/ipwatchdog.$$
fi
