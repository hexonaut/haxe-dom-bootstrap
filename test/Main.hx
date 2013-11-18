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
		var nav = new ENav().navbar(Inverse, StaticTop).add(new EAnchor().brand().addText("Brand Text").attr(href, "#"));
		nav.add(new EForm().navbarElement().add(new EDiv().formGroup().add(new EInput(Search).formControl())).add(new EButton().button().addIcon(Search)));
		
		var cont = new EDiv().container();
		
		cont.add(new EUnorderedList().breadcrumbs().add(new EListItem().addText("Main Page")).add(new EListItem().addText("Secondary Page")).add(new EListItem().addText("Active Page").active()));
		
		var col1 = new EDiv().md(4).add(new EHeader1().setText("Col 1"))
		.add(new EParagraph().textAlign(Right).lead().addText("Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
		.add(new EParagraph().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var col2 = new EDiv().md(8).add(new EHeader1().setText("Col 2"))
		.add(new EParagraph().emphasis(Warning).addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."))
		.add(new EPre().scrollable().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var table = Table.build([["Head1", "Head2", "Head3"], [1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6]], [Hover, Striped]);
		
		var form = new EForm()
		.add(new LabelledCheckbox("A common checkbox", "asdf", true))
		.add(new LabelledCheckbox("An unchecked checkbox"))
		;
		
		var dropdownBtn = new DropdownButton("Dropdown Btn", Primary);
		dropdownBtn.dropdown.addHeader("Header 1").addLink("#", "Link 1").addLink("#", "Link 2").addDivider().addHeader("Header 2").addLink("#", "Link 3").addLink("#", "Link 4");
		
		var panel = new Panel(Primary);
		panel.header.add(new EHeader3().classes("panel-title").addText("A table inside a panel with a header!"));
		panel.body.add(new EParagraph().addText("Some default panel content here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit."));
		panel.add(Table.build([["#", "First Name", "Last Name", "Username"], ["1", "Mark", "Otto", "@mdo"], ["2", "Jacob", "Thornton", "@fat"], ["3", "Sam", "MacPherson", "@sgmacpherson"]]));
		
		var modal = new Modal();
		modal.closeable = true;
		modal.header.add(new EHeader4().addText("Modal Title"));
		modal.body.add(new EParagraph().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		var modalBtn = new EButton().button(Primary, Large).addText("Popup!");
		modalBtn.linkModal(modal);
		
		var tabs = new TabbedPane([
		{label:"Tab 1", content:new EParagraph().addText("Tab Content 1. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") },
		{label:"Tab 2", content:new EParagraph().addText("Tab Content 2. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") },
		{label:"Tab 3", content:new EParagraph().addText("Tab Content 3. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") }
		]);
		tabs.setActive(0);
		
		cont.add(new ProgressBar(5, 10, Danger, Animated));
		cont.add(col1).add(col2).add(table).add(form);
		for (i in Type.allEnums(IconType)) {
			cont.add(new Icon(i));
		}
		cont.add(panel);
		cont.add(tabs);
		col1.add(new EDiv().add(dropdownBtn));
		col1.add(modal).add(modalBtn);
		
		var html = new EHtml();
		html.attr(lang, "en");
		var head = new EHead();
		head.add(new EMeta().attr(charset, "utf-8"));
		head.add(new ELink().attr(rel, "stylesheet").attr(href, "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"));
		head.add(new ELink().attr(rel, "stylesheet").attr(href, "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css"));
		head.add(new EScript().addText("HTMLDetailsElement = HTMLElement;"));
		head.add(new EScript().attr(src, "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js").attr(defer, true));
		head.add(new EScript().attr(src, "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js").attr(defer, true));
		head.add(new EScript().attr(src, "client.js").attr(defer, true));
		var body = new EBody();
		body.add(nav);
		body.add(cont);
		
		html.add(head).add(body);
		
		#if benchmark
		var mark = haxe.Timer.stamp();
		for (i in 0 ... 100) {
			hxdom.HTMLSerializer.run(html);
		}
		neko.Lib.println('Serialize (HTMLSerializer): ${Math.round((haxe.Timer.stamp() - mark)*1000/100)} ms');
		#end
		
		sys.io.File.saveContent("index.html", hxdom.HTMLSerializer.run(html));
		#end
	}
	
}