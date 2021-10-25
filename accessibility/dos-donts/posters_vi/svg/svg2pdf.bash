#!/bin/bash
#
# Convert an SVG file to a PDF file by using headless Chrome.
#



INPUT=$1
OUTPUT=$2

HTML="
<html>
  <head>
    <style>
body {
  margin: 0;
}
    </style>
    <script>
function init() {
  const element = document.getElementById('targetsvg');
  const positionInfo = element.getBoundingClientRect();
  const height = positionInfo.height;
  const width = positionInfo.width;
  const style = document.createElement('style');
  style.innerHTML = \`@page {margin: 0; size: \${width}px \${height}px}\`;
  document.head.appendChild(style);
}
window.onload = init;
    </script>
  </head>
  <body>
    <img id=\"targetsvg\" src=\"${INPUT}\">
  </body>
</html>
"

tmpfile=$(mktemp XXXXXX.html)
echo $HTML > $tmpfile
