haxe-dom-bootstrap
==================

Provides type safe usage of Twitter Bootstrap components with [haxe-dom](https://github.com/Blank101/haxe-dom). Start extending these components to build advanced applications!

Check out test/Main.hx for a bunch of usage examples. Build using the following command:

	haxe -cp src -cp test -lib hxdom -js bin/client.js -main Main
	--next
	-cp src -cp test -lib hxdom -neko bin/bs.n -main Main

Run the neko binary to create an index.html file which you can then open in your browser.

Benchmarks
==========

Running a benchmark of my demo page yields the following times on a win7-64bit i7 Dell Inspiron laptop (8 CPUs):

	Serialize (haxe.Serializer): 230 ms
	Serialize (HTMLSerializer): 10 ms

As you can see the HTMLSerializer is about 2300% faster than the regular serializer for DOM-heavy code. The example page is roughly the size of an above-average web document (33.4KiB). For reference the average HTML document contains ~4KiB of data according to http://httparchive.org/.

Components
==========

Here are some examples of using components. This code can be ran either on the server or the client. It works exactly the same. :)

Dropdown Menu
-------------

See [http://getbootstrap.com/components/#btn-dropdowns](http://getbootstrap.com/components/#btn-dropdowns). This example will recreate the "Primary Button" display on the bootstrap page.

	import hxdom.Elements;
	
	using hxdom.BSTools;
	using hxdom.DomTools;
	
	//Create a dropdown button
	var myDropDownBtn = hxdom.bootstrap.DropdownButton.create("Primary", Primary);
	myDropDownBtn.dropdown
	.addLink("#", "Action")
	.addLink("#", "Another action")
	.addLink("#", "Something else here")
	.addDivider()
	.addLink("#", "Separated link");
	
	//Add it to some container (could be any DOM element)
	myContainer.add(myDropDownBtn);

Icon
----

See [http://getbootstrap.com/components/#glyphicons](http://getbootstrap.com/components/#glyphicons). This example will create a "Search" icon.

	import hxdom.Elements;
	
	using hxdom.BSTools;
	using hxdom.DomTools;
	
	var mySearchIcon = hxdom.bootstrap.Icon.create(Search);
	
	myContainer.add(mySearchIcon);

Modal Popup
===========

See [http://getbootstrap.com/javascript/#modals](http://getbootstrap.com/javascript/#modals). This example will create a modal with a button that will launch it.

	import hxdom.Elements;
	
	using hxdom.BSTools;
	using hxdom.DomTools;
	
	var myModal = hxdom.bootstrap.Modal.create();
	//Add a close button
	myModal.closeable = true;
	//Add a title to the modal header
	myModal.header.add(EHeader4.create().addText("Modal Title"));
	//Add a paragraph to the body of the modal
	myModal.body.add(EParagraph.create().addText("A paragraph of text inside the modal."));
	
	//Create a button
	var myModalBtn = EButton.create().button(Primary, Large).addText("Popup!");
	
	//Link the button to the modal so it will popup
	myModalBtn.linkModal(myModal);
	
	myContainer.add(myModal);
	myContainer.add(myModalBtn);

Tabbed Pane
===========

See [http://getbootstrap.com/javascript/#tabs](http://getbootstrap.com/javascript/#tabs). Create a tabbed pane. Content changes based on the active tab.

	import hxdom.Elements;
	
	using hxdom.BSTools;
	using hxdom.DomTools;
	
	//Create the tabbed pane
	var myTabs = TabbedPane.create([
		{label:"Tab 1", content:EParagraph.create().addText("Tab Content 1. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") },
		{label:"Tab 2", content:EParagraph.create().addText("Tab Content 2. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") },
		{label:"Tab 3", content:EParagraph.create().addText("Tab Content 3. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") }
	]);
	//Set the first tab to active by default
	myTabs.setActive(0);
	
	myContainer.add(myTabs);