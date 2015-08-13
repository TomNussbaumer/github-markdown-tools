#!/bin/sh
#
# converts markdown file to html using github's REST api
#
# The MIT License (MIT)
#
# Copyright (c) 2015 Tom Nussbaumer <thomas.nussbaumer@gmx.net>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

showUsage() {
  echo "USAGE: $0 <markdown-file>"
  echo
  echo "converts given markdown file to html using github's REST api"
  echo
  echo " markdown-file  .......  file to convert"
}

if [ $# -lt 1 ]; then
  showUsage
  exit 1
fi

if [ "$(which curl)" = "" ]; then
  echo "[ERROR] program curl required. please install."
  exit 2
fi

if [ ! -f "$1" ]; then
  echo "[ERROR] file ($1) not found"
  exit 3
fi

DATA=$(curl -s --data-binary @"$1" -H "Content-Type:text/plain" https://api.github.com/markdown/raw)
EXITCODE=$?
if [ $EXITCODE -ne 0 ]; then
  echo "[ERROR] failed to convert file ($1)"
  exit $EXITCODE
fi

cat << __UNTIL_HERE__
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="description" content="please_fill">
  <meta name="author" content="please_fill">
</head>
<body>
__UNTIL_HERE__
echo "$DATA"
echo "</body></html>"

exit 0

