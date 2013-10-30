haxe-dom-bootstrap provides type safe usage of Twitter Bootstrap components with haxe-dom (my other cross-platform DOM implementation). Start extending these components to build advanced applications!

Check out test/Main.hx for a bunch of usage examples. Build using the following command:

	haxe -cp src -cp test -lib hxdom -js bin/client.js -main Main
	--next
	-cp src -cp test -lib hxdom -neko bin/bs.n -main Main

Run the neko binary to create an index.html file which you can then open in your browser.