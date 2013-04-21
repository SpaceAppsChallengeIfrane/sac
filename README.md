LE TWO IDEAS:
=============

     random marbles moving, each one represents a picture, and filtering

     le check in, how does it look from above.

remaining
=========

- two views (random and world map)

RANDOM VIEW
------------
- CREATE 1000 balls with one attribute: random number.
- when clicking one ball:
	* choose a random record (find a way to do it with mongoDB)
	* fetch the image (REST interface, get JSON string, REGex, match and display)
	* the description, the features and the origin, lat and lon (REST interface, get JSON string, REGex, match and display)

WORLD MAP VIEW
--------------
- finding a world map
- mapping lon, lat to pixels
- long, lat selectors (moves differently[keyboard or right-click])
- slider for distance threshold