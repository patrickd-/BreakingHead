#!/bin/bash
if [ $# -eq 0 ]
  then
    echo ""
    echo "Usage: $0 [issue url]#comment-[comment id]"
    echo ""
    echo "Example comment: "
    echo " => $0 https://drupal.org/node/1170192#comment-6578792"
    echo ""
    echo "Easiest way to get this URL is by clicking on the comment anchor."
    echo ""
    exit
fi

IFS='#' read -ra ARG <<< "$1"

echo "ISSUE URL:  ${ARG[0]}"
echo "COMMENT ID: ${ARG[1]}"

echo "DOWNLOADING ISSUE PAGE"

curl "${ARG[0]}" > tmp.htm

echo "SELECTING COMMENT"
sed '/<!DOCTYPE html>/,/<body/ !d' tmp.htm > comment.htm
echo '<style>body{font-size: 1.5em;} .comment{width: 850px;}</style>' >> comment.htm
sed "/<a id=\"${ARG[1]}\">/,/<\/ul>/ !d" tmp.htm >> comment.htm
echo '</body></html>' >> comment.htm
sed '/comment_forbidden/d' ./comment.htm > comment2.htm

echo "CREATING SCREENSHOT"
gnome-web-photo --mode=photo --width=900 --file "comment2.htm" comment.png
rm tmp.htm
rm comment.htm
rm comment2.htm

echo "ROTATE IMAGE"
convert -rotate 90 comment.png comment.png

echo "RESIZE"
convert comment.png -gravity center -extent 815x1110 card.png
rm comment.png
