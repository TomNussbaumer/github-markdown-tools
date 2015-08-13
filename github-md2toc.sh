#!/bin/sh
#
# generates 'table of content' section for a given markdown file 
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
  echo "generates table-of-content section for a given markdown file by using"
  echo "github's REST api"
  echo
  echo " markdown-file  .......  file to generate table-of-content for"
}

if [ $# -lt 1 ]; then
  showUsage
  exit 1
fi

if [ "$(which curl)" = "" ]; then
  echo "[ERROR] program curl required. please install."
  exit 2
fi

if [ "$(which xsltproc)" = "" ]; then
  echo "[ERROR] program xsltproc required. please install."
  exit 3
fi

TMPVAR=$(dirname "$(pwd)/$0")
TOCXSL=$(readlink -f "$TMPVAR/toc.xsl")

if [ ! -f "$TOCXSL" ]; then
  echo "[ERROR]: file (toc.xsl) required but not found"
  exit 4
fi

if [ ! -f "$1" ]; then
  echo "[ERROR]: file ($1) not found"
  exit 5
fi

# only with bash
# set -o pipefail

curl -s --data-binary @"$1" -H "Content-Type:text/plain" https://api.github.com/markdown/raw | xsltproc --html "$TOCXSL" -
exit $?
