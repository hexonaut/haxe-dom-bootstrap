package hxdom.bootstrap;

import hxdom.Elements;
import js.html.Element;
import js.html.Event;
import js.JQuery;

using hxdom.BSTools;
using hxdom.DomTools;

typedef TabPane = {
	label:String,
	content:Element
};

/**
 * Content switches based on the active tab.
 * 
 * @author Sam MacPherson
 */
class TabbedPane extends EDiv {
	
	/**
	 * The panes of this element.
	 */
	public var panes(default, set):Array<TabPane>;
	
	var enav:EUnorderedList;
	var econtent:EDiv;

	public function new (?panes:Array<TabPane>) {
		super();
		
		enav = EUnorderedList.create().nav(Tabs);
		econtent = EDiv.create().classes("tab-content");
		
		add(enav);
		add(econtent);
		
		if (panes != null) this.panes = panes;
	}
	
	function set_panes (panes:Array<TabPane>):Array<TabPane> {
		for (i in enav.children) {
			i.firstChild.removeEventListener("click", onTabSelected);
		}
		enav.clear();
		econtent.clear();
		
		this.panes = panes;
		
		for (i in panes) {
			var anchor = EAnchor.create().attr(href, "#").addText(i.label);
			anchor.addEventListener("click", onTabSelected);
			untyped anchor.__content = i.content;
			enav.add(EListItem.create().add(anchor));
			i.content.classes("tab-pane");
			econtent.add(i.content);
		}
		
		return panes;
	}
	
	public function clearActive ():Void {
		for (i in enav.children) {
			cast(i, Element).removeClasses("active");
		}
		for (i in econtent.children) {
			cast(i, Element).removeClasses("active");
		}
	}
	
	public function setActive (index:Int):Void {
		clearActive();
		
		cast(enav.children[index], Element).classes("active");
		cast(econtent.children[index], Element).classes("active");
	}
	
	function onTabSelected (e:Event):Void {
		//Remove other tab selections
		clearActive();
		
		var anchor:EAnchor = cast e.currentTarget;
		anchor.parentElement.classes("active");
		untyped DomTools.classes(anchor.__content, "active");
		
		e.preventDefault();
	}
	
}