package ;

import hxdom.bootstrap.CloseButton;
import hxdom.bootstrap.Dropdown;
import hxdom.bootstrap.DropdownButton;
import hxdom.bootstrap.Icon;
import hxdom.bootstrap.LabelledCheckbox;
import hxdom.bootstrap.LabelledRadio;
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
	
	static var html:EHtml;
	static var modalGroup:ModalGroup;
	
	static function main () {
		#if js
		html = cast hxdom.js.Boot.init();
		modalGroup = new ModalGroup();
		html.node.childNodes[1].vnode().add(modalGroup);
		#else
		var nav = new ENav().navbar(Inverse, StaticTop).add(new EAnchor().brand().addText("Brand Text").attr(Href, "#"));
		nav.add(new EForm().navbarElement().add(new EDiv().formGroup().add(new EInput(Search).formControl())).add(new EButton().button().addIcon(Search)));
		
		var cont = new EDiv().container();
		
		cont.add(new EUnorderedList().breadcrumbs().add(new EListItem().addText("Main Page")).add(new EListItem().addText("Secondary Page")).add(new EListItem().addText("Active Page").active()));
		
		var col1 = new EDiv().md(4).add(new EHeader1().setText("Col 1"))
		.add(new EParagraph().textAlign(Right).lead().addText("Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
		.add(new EParagraph().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var col2 = new EDiv().md(8).add(new EHeader1().setText("Col 2"))
		.add(new EParagraph().emphasis(Warning).addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."))
		.add(new EPre().scrollable().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var table = Table.build([[new Text("Head1"), new Text("Head2"), new Text("Head3")], [new Text("1"), new Text("2"), new Text("3")], [new Text("4"), new Text("5"), new Text("6")], [new Text("1"), new Text("2"), new Text("3")], [new Text("4"), new Text("5"), new Text("6")], [new Text("1"), new Text("2"), new Text("3")], [new Text("4"), new Text("5"), new Text("6")], [new Text("1"), new Text("2"), new Text("3")], [new Text("4"), new Text("5"), new Text("6")]], [Hover, Striped]);
		
		var form = new EForm()
		.add(new LabelledCheckbox("A common checkbox", "asdf", true))
		.add(new LabelledCheckbox("An unchecked checkbox"))
		.add(new LabelledRadio("Radio 1", "radio", "val1"))
		.add(new LabelledRadio("Radio 2", "radio", "val2", true))
		;
		
		var dropdownBtn = new DropdownButton("Dropdown Btn", Primary);
		dropdownBtn.dropdown.addHeader("Header 1").addLink("#", "Link 1").addLink("#", "Link 2").addDivider().addHeader("Header 2").addLink("#", "Link 3").addLink("#", "Link 4");		
		var panel = new Panel(Primary);
		panel.header.add(new EHeader3().classes("panel-title").addText("A table inside a panel with a header!"));
		panel.body.add(new EParagraph().addText("Some default panel content here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit."));
		panel.add(Table.build([[new Text("#"), new Text("First Name"), new Text("Last Name"), new Text("Username")], [new Text("1"), new Text("Mark"), new Text("Otto"), new Text("@mdo")], [new Text("2"), new Text("Jacob"), new Text("Thornton"), new Text("@fat")], [new Text("3"), new Text("Sam"), new Text("MacPherson"), new Text("@sgmacpherson")]]));
		
		var modalBtn = new EButton().button(Primary, Large).addText("Popup!");
		modalBtn.addEventListener("click", popupModal);
		
		var tabs = new TabbedPane()
		.addPane({label:"Tab 1", content:new EParagraph().addText("Tab Content 1. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") })
		.addPane({label:"Tab 2", content:new EParagraph().addText("Tab Content 2. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") })
		.addPane({label:"Tab 3", content:new EParagraph().addText("Tab Content 3. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") });
		tabs.active = 0;
		
		cont.add(new ProgressBar(5, 10, Danger, Animated));
		cont.add(col1).add(col2).add(table).add(form);
		for (i in Type.allEnums(IconType)) {
			cont.add(new Icon(i));
		}
		cont.add(panel);
		cont.add(tabs);
		col1.add(new EDiv().add(dropdownBtn));
		col1.add(modalBtn);
		
		html = new EHtml();
		html.attr(Lang, "en");
		var head = new EHead();
		head.add(new EMeta().attr(Charset, "utf-8"));
		head.add(new ELink().attr(Rel, "stylesheet").attr(Href, "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"));
		head.add(new ELink().attr(Rel, "stylesheet").attr(Href, "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css"));
		head.add(new EScript().addText("HTMLDetailsElement = HTMLElement;"));
		head.add(new EScript().attr(Src, "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js").attr(Defer, true));
		head.add(new EScript().attr(Src, "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js").attr(Defer, true));
		head.add(new EScript().attr(Src, "client.js").attr(Defer, true));
		var body = new EBody();
		body.add(nav);
		body.add(cont);
		
		html.add(head).add(body);
		
		#if benchmark
		var mark = haxe.Timer.stamp();
		for (i in 0 ... 100) {
			hxdom.HtmlSerializer.run(html);
		}
		neko.Lib.println('Serialize (HTMLSerializer): ${Math.round((haxe.Timer.stamp() - mark)*1000/100)} ms');
		#end
		
		sys.io.File.saveContent("index.html", hxdom.HtmlSerializer.run(html));
		#end
	}
	
	static function popupModal (_):Void {
		trace("popup");
		var modal = new Modal();
		var btn = new CloseButton();
		modal.header.add(btn);
		modal.header.add(new EHeader4().addText("Modal Title"));
		modal.body.add(new EParagraph().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		modalGroup.addModal(modal);
		btn.addEventListener("click", closePopup);
	}
	
	static function closePopup (_):Void {
		modalGroup.modals[0].close();
	}
	
}