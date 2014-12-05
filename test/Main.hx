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
		html.node.childNodes[1].vnode().append(modalGroup);
		#else
		var nav = new ENav().navbar(Inverse, StaticTop).append(new EAnchor().brand().addText("Brand Text").setAttr("href", "#"));
		nav.append(new EForm().navbarElement().append(new EDiv().formGroup().append(new EInput(Search).formControl())).append(new EButton().button().addIcon(Search)));
		
		var cont = new EDiv().container();
		
		cont.append(new EUnorderedList().breadcrumbs().append(new EListItem().addText("Main Page")).append(new EListItem().addText("Secondary Page")).append(new EListItem().addText("Active Page").active()));
		
		var col1 = new EDiv().md(4).append(new EHeader1().setText("Col 1"))
		.append(new EParagraph().textAlign(Right).lead().addText("Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
		.append(new EParagraph().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var col2 = new EDiv().md(8).append(new EHeader1().setText("Col 2"))
		.append(new EParagraph().emphasis(Warning).addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."))
		.append(new EPre().scrollable().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var table = Table.build([[new Text("Head1"), new Text("Head2"), new Text("Head3")], [new Text("1"), new Text("2"), new Text("3")], [new Text("4"), new Text("5"), new Text("6")], [new Text("1"), new Text("2"), new Text("3")], [new Text("4"), new Text("5"), new Text("6")], [new Text("1"), new Text("2"), new Text("3")], [new Text("4"), new Text("5"), new Text("6")], [new Text("1"), new Text("2"), new Text("3")], [new Text("4"), new Text("5"), new Text("6")]], [Hover, Striped]);
		
		var form = new EForm()
		.append(new LabelledCheckbox("A common checkbox", "asdf", true))
		.append(new LabelledCheckbox("An unchecked checkbox"))
		.append(new LabelledRadio("Radio 1", "radio", "val1"))
		.append(new LabelledRadio("Radio 2", "radio", "val2", true))
		;
		
		var dropdownBtn = new DropdownButton("Dropdown Btn", Primary);
		dropdownBtn.dropdown.addHeader("Header 1").addLink("#", "Link 1").addLink("#", "Link 2").addDivider().addHeader("Header 2").addLink("#", "Link 3").addLink("#", "Link 4");		
		var panel = new Panel(Primary);
		panel.header.append(new EHeader3().addClass("panel-title").addText("A table inside a panel with a header!"));
		panel.body.append(new EParagraph().addText("Some default panel content here. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam id dolor id nibh ultricies vehicula ut id elit."));
		panel.append(Table.build([[new Text("#"), new Text("First Name"), new Text("Last Name"), new Text("Username")], [new Text("1"), new Text("Mark"), new Text("Otto"), new Text("@mdo")], [new Text("2"), new Text("Jacob"), new Text("Thornton"), new Text("@fat")], [new Text("3"), new Text("Sam"), new Text("MacPherson"), new Text("@sgmacpherson")]]));
		
		var modalBtn = new EButton().button(Primary, Large).addText("Popup!");
		modalBtn.addEventListener("click", popupModal);
		
		var tabs = new TabbedPane()
		.addPane({label:"Tab 1", content:new EParagraph().addText("Tab Content 1. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") })
		.addPane({label:"Tab 2", content:new EParagraph().addText("Tab Content 2. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") })
		.addPane({label:"Tab 3", content:new EParagraph().addText("Tab Content 3. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus.") });
		tabs.active = 0;
		
		cont.append(new ProgressBar(5, 10, Danger, Animated));
		cont.append(col1).append(col2).append(table).append(form);
		for (i in Type.allEnums(IconType)) {
			cont.append(new Icon(i));
		}
		cont.append(panel);
		cont.append(tabs);
		col1.append(new EDiv().append(dropdownBtn));
		col1.append(modalBtn);
		
		html = new EHtml();
		html.setAttr("lang", "en");
		var head = new EHead();
		head.append(new EMeta().setAttr("charset", "utf-8"));
		head.append(new ELink().setAttr("rel", "stylesheet").setAttr("href", "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"));
		head.append(new ELink().setAttr("rel", "stylesheet").setAttr("href", "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css"));
		head.append(new EScript().addText("HTMLDetailsElement = HTMLElement;"));
		head.append(new EScript().setAttr("src", "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js").setAttr("defer", true));
		head.append(new EScript().setAttr("src", "http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js").setAttr("defer", true));
		head.append(new EScript().setAttr("src", "client.js").setAttr("defer", true));
		var body = new EBody();
		body.append(nav);
		body.append(cont);
		
		html.append(head).append(body);
		
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
		modal.header.append(btn);
		modal.header.append(new EHeader4().addText("Modal Title"));
		modal.body.append(new EParagraph().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		modalGroup.addModal(modal);
		btn.addEventListener("click", closePopup);
	}
	
	static function closePopup (_):Void {
		modalGroup.modals[0].close();
	}
	
}