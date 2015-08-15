# github-markdown-tools

This repository contains helper scripts for Markdown.

## Why oh Why

Yeah, markdown is great. Less typing = more time for other stuff. But related to how Github handles Markdown files like the README.md there is one major letdown:

Github doesn't handle table-of-content sections automatically. Handling table-of-content sections by hand is not so bad for short documents, but for larger ones (where TOCs become useful) it get's really fast REALLY ugly. 

Script `github-md2toc.sh` generates a table-of-content section for your Markdown file, ready for copy-and-paste. 

And because Github was TOOOO lazy to generate a TOC for your markdown file, the script will utilize Github itself to do some of the "heavy" lifting (take this :). 

Processing steps:

  * convert markdown file to HTML by using Github's REST api
  * extract anchor links and text from all heading tags and rewrite it as markdown TOC by using xslt
  
That's it.

`github-md2html.sh` is just a by-product. It converts a local markdown file to html (again by using Github's REST api).

### TODO

  * support for special markers in the markdown file to automatically insert the TOC there
  * streaming support (unix piping mechanism)
