Breaking Head
=============

###Open source card game about the Drupal.org issue queue.

**This game makes the assumption that there are bad people in the issue queue on drupal.org - this is not the case! Luckily the Drupal community consists of very friendly contributors always willing to help each other. But sometimes working in the queue can be depressing and this game covers situations when people have the feeling that progress is willingly blocked for no good reason.**


About the game
--------------

This game is based on the card game [Saboteur designed by Frederic Moyersoen](http://en.wikipedia.org/wiki/Saboteur_\(card_game\)) where players are either assigned the role of the good *contributor* or the bad *blocker*.

Further details can be found in the game manual.

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

####What the /cards/build.sh-script does
It basically copies all images from the recursive src/front folder over the the flat build/ directory.
Additionally it determines the appropriate card back-image and moves it to the build/ directory for each group of cards.
When there are layout-overlay images in "__layout" folders with proplerly named .png files, it will composit them with their card images.
As a result all the card fronts should be available as build/[group-name]/[serial number beginning at 1]-[image name].png and the cards back for the whole group should be prefixed with "0-". 


Status
------
This game is still a work-in-progress and you can add your own cards!

- [X] Implement a script to automatically build cards based on layouts and images
- [ ] Add suitable images for all cards (at the moment there is only a dummy image for each card)
- [ ] Create a pictured game manual based on the original
- [ ] Design a packaging for the cards
- [ ] Print a prototype of the game, make pictures and add them to the game manual
- [ ] Test the prototype and fix issues with the images
- [ ] Print and distribute the game on the next drupal camp and cons?
