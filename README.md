Breaking Head
=============

[![Tips](http://img.shields.io/gittip/patrickd.png)](https://www.gittip.com/patrickd/)

###Open source card game about the Drupal.org issue queue.

**This game makes the assumption that there are bad people in the issue queue on drupal.org - this is not the case! Luckily the Drupal community consists of very friendly contributors always willing to help each other. But sometimes working in the queue can be depressing and this game covers situations when people have the feeling that progress is willingly blocked for no good reason.**

!["Image of an example breaking head playing card"](https://raw.github.com/patrickd-/BreakingHead/master/other/logo.png "Breaking Head playing card game")


About the game
--------------

This game is based on the card game [Saboteur designed by Frederic Moyersoen](http://en.wikipedia.org/wiki/Saboteur_\(card_game\)) where players are either assigned the role of the good *contributor* or the bad *blocker*.

Further details can be found in the [game manual](https://github.com/patrickd-/BreakingHead/blob/master/manual/manual.pdf?raw=true).

Editions
--------
Each edition is [tagged](https://github.com/patrickd-/BreakingHead/releases).

- [**1st-edition**](https://github.com/patrickd-/BreakingHead/releases/tag/1st-edition): 1 copy

!["1st-edition of BreakingHead"](https://raw.github.com/patrickd-/BreakingHead/master/other/1st-edition-thumb.jpg "1st-edition of BreakingHead")


- [**2nd-edition**](https://github.com/patrickd-/BreakingHead/releases/tag/2nd-edition): 4 copies
- [**3rd-edition**](https://github.com/patrickd-/BreakingHead/releases/tag/3rd-edition): 12 copies

Printing
--------

- **Card size:** 63 × 88 mm (815 × 1110 pixels, Int. poker format)
- **Manual:** 210 × 297 mm (DIN A4, ISO 216)
- **Packaging:** Not final yet.


About this repository
---------------------


####Directory structure

- **/cards/**: Contains all data about the actual playing cards
- **/cards/build.sh**: Script to automatically generate the cards from the src/ folder to the build/ folder.
- **/cards/build/**: The generated cards, ready for printing.
- **/cards/src/**: The source images of the cards, need to be processed first.
- **/cards/src/back/**: The card back-images. (Named by "[group-name].png")
- **/cards/src/front/**: Contains the group names of card front images as folders.
- **/cards/src/front/[group-name]/**: Contains the types of cards as folders and the card layout-overlays.
- **/cards/src/front/[group-name]/__layout/**: Contains the layout-overlay images that will be composited on top of the card images. Each overlay file is named like [group-name].png. All card images of these groups will be composited with that overlay image.
- **/cards/src/front/[group-name]/[card-type]/**: Contains all the card images of this type and group. These images are dummy-images at the beginning and need to be replaced with appropriate ones.
- **/manual/**: Contains the game manual (editable and as PDF)
- **/packaging/**: Contains the game packaging design.

####/cards/build.sh

It basically copies all images from the recursive src/front folder over the the flat build/ directory.
Additionally it determines the appropriate card back-image and moves it to the build/ directory for each group of cards.
When there are layout-overlay images in "__layout" folders with proplerly named .png files, it will composit them with their card images.
As a result all the card fronts should be available as build/[group-name]/[serial number beginning at 1]-[image name].png and the cards back for the whole group should be prefixed with "0-". 


####/cards/comment2card.sh

Takes a drupal.org issue url with comment-anchor as argument and creates a card (screenshot with exact card dimensions) out of the specified comment.
