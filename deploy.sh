#!/bin/bash

# Credentials in ~/.netrc

set -euo pipefail

DOMAIN=beta.stigjohan.no

lftp <<EOF
open "$DOMAIN"
set ftp:ssl-force true
set ftp:ssl-protect-data true
mirror -R build/ domains/"$DOMAIN"/public_html/
bye
EOF
