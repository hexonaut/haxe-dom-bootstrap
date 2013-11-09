package ;

import hxdom.bootstrap.Dropdown;
import hxdom.bootstrap.DropdownButton;
import hxdom.bootstrap.Icon;
import hxdom.bootstrap.LabelledCheckbox;
import hxdom.bootstrap.Modal;
import hxdom.bootstrap.Panel;
import hxdom.bootstrap.ProgressBar;
import hxdom.bootstrap.TabbedPane;
import hxdom.bootstrap.Table;
import hxdom.Elements;

using hxdom.BSTools;
using hxdom.DomTools;

/**
 * Testing for bootstrap.
 * 
 * @author Sam MacPherson
 */

class Main {
	
	static function main () {
		#if js
		var html = hxdom.js.Boot.init();
		#else
		var nav = ENav.create().navbar(Inverse, StaticTop).add(EAnchor.create().brand().addText("Brand Text").attr(href, "#"));
		nav.add(EForm.create().navbarElement().add(EDiv.create().formGroup().add(EInput.create(Search).formControl())).add(EButton.create().button().addIcon(Search)));
		
		var cont = EDiv.create().container();
		
		cont.add(EUnorderedList.create().breadcrumbs().add(EListItem.create().addText("Main Page")).add(EListItem.create().addText("Secondary Page")).add(EListItem.create().addText("Active Page").active()));
		
		var col1 = EDiv.create().md(4).add(EHeader1.create().setText("Col 1"))
		.add(EParagraph.create().textAlign(Right).lead().addText("Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
		.add(EParagraph.create().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var col2 = EDiv.create().md(8).add(EHeader1.create().setText("Col 2"))
		.add(EParagraph.create().emphasis(Warning).addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."))
		.add(EPre.create().scrollable().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var table = Table.build([["Head1", "Head2", "Head3"], [1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6]], [Hover, Striped]);
		
		var form = EForm.create()
		.add(LabelledCheckbox.create("A common checkbox", "asdf", true))
		.add(LabelledCheckbox.create("An unchecked checkbox"))
		;
		
		var dropdownBtn = DropdownButton.create("Dropdown Btn", Primary);
		dropdownBtn.dropdown.addHeader("Header 1").addLink("#", "Link 1").addLink("#", "Link 2").addDivider().addHeader("Header 2").addLink("#", "Link 3").addLink("#", "Link 4");
		
		var panel = Panel.create(Primary);
		panel.header.add(EHeader3.create().classes("panel-title").addText("A table inside a panel with a header!"));
		panel.body.add(EParagraph.create().addText("Some default panel content here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit."));
		panel.add(Table.build([["#", "First Name", "Last Name", "Username"], ["1", "Mark", "Otto", "@mdo"], ["2", "Jacob", "Thornton", "@fat"], ["3", "Sam", "MacPherson", "@sgmacpherson"]]));
		
		var modal = Modal.create();
		modal.closeable = true;
		modal.header.add(EHeader4.create().addText("Modal Title"));
		modal.body.add(EParagraph.create().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		var modalBtn = EButton.create().button(Primary, Large).addText("Popup!");
		modalBtn.linkModal(modal);
		
		var tabs = TabbedPane.create([
		{label:"Tab 1", content:EParagraph.create().addText("Tab Content 1. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") },
		{label:"Tab 2", content:EParagraph.create().addText("Tab Content 2. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") },
		{label:"Tab 3", content:EParagraph.create().addText("Tab Content 3. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") }
		]);
		tabs.setActive(0);
		
		cont.add(ProgressBar.create(5, 10, Danger, Animated));
		cont.add(col1).add(col2).add(table).add(form);
		for (i in Type.allEnums(IconType)) {
			cont.add(Icon.create(i));
		}
		cont.add(panel);
		cont.add(tabs);
		col1.add(EDiv.create().add(dropdownBtn));
		col1.add(modal).add(modalBtn);
		
		var html = EHtml.create();
		html.attr(lang, "en");
		var head = EHead.create();
		head.add(EMeta.create().unsafeAttr(charset, "utf-8"));
		head.add(ELink.create().attr(rel, "stylesheet").attr(href, "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"));
		head.add(ELink.create().attr(rel, "stylesheet").attr(href, "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css"));
		head.add(EScript.create().addText("HTMLDetailsElement = HTMLElement;"));
		head.add(EScript.create().attr(src, "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js").attr(defer, true));
		head.add(EScript.create().attr(src, "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js").attr(defer, true));
		head.add(EScript.create().attr(src, "client.js").attr(defer, true));
		var body = EBody.create();
		body.add(nav);
		body.add(cont);
		
		html.add(head).add(body);
		
		#if benchmark
		haxe.Serializer.USE_CACHE = true;
		var mark = haxe.Timer.stamp();
		for (i in 0 ... 10) {
			haxe.Serializer.run(html);
		}
		neko.Lib.println('Serialize (haxe.Serializer): ${Math.round((haxe.Timer.stamp() - mark)*1000/10)} ms');
		
		mark = haxe.Timer.stamp();
		for (i in 0 ... 100) {
			hxdom.HTMLSerializer.run(html);
		}
		neko.Lib.println('Serialize (HTMLSerializer): ${Math.round((haxe.Timer.stamp() - mark)*1000/100)} ms');
		#end
		
		sys.io.File.saveContent("index.html", hxdom.HTMLSerializer.run(html));
		#end
	}
	
}