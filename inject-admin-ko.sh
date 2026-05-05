#!/bin/sh
INDEX=/var/lib/ghost/current/core/built/admin/index.html
SCRIPT='<script src="./assets/ghost-admin-ko.v2.js"></script></body>'

if grep -q 'ghost-admin-ko' $INDEX; then
  sed -i 's|./assets/ghost-admin-ko.js|./assets/ghost-admin-ko.v2.js|g' $INDEX
  echo "ALREADY_INJECTED"
else
  sed -i "s|</body>|$SCRIPT|" $INDEX
  echo "INJECTED"
fi

grep 'ghost-admin-ko' $INDEX
