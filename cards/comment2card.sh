#!/bin/bash
if [ $# -eq 0 ]
  then
    echo ""
    echo "Usage: $0 [issue url] [comment id]"
    echo ""
    echo "Example comment: https://drupal.org/node/1170192#comment-6578792"
    echo " => $0 https://drupal.org/node/1170192 6578792"
    echo ""
    exit
fi

echo "DOWNLOADING ISSUE PAGE"

curl "$1" > tmp.htm

echo "SELECTING COMMENT"
sed '/<!DOCTYPE html>/,/<body/ !d' tmp.htm > comment.htm
sed "/<a id=\"comment-$2\">/,/<a id=\"comment-/ !d" tmp.htm >> comment.htm
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
