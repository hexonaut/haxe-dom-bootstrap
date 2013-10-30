package hxdom.bootstrap;

import hxdom.Elements;
import hxdom.html.Element;
import hxdom.html.Node;

using hxdom.DomTools;

/**
 * Bootstrap dropdown menu component.
 * 
 * @author Sam MacPherson
 */
class Dropdown extends EUnorderedList {

	public function new () {
		super();
		
		className = "dropdown-menu";
	}
	
	public function addItem (e:Node):Dropdown {
		add(EListItem.create().add(e));
		
		return this;
	}
	
	public function addDivider ():Dropdown {
		add(EListItem.create().classes("divider"));
		
		return this;
	}
	
	public function addHeader (label:String):Dropdown {
		add(EListItem.create().classes("dropdown-header").addText(label));
		
		return this;
	}
	
	public function addLink (url:String, label:String):Dropdown {
		addItem(EAnchor.create().attr(href, url).addText(label));
		
		return this;
	}
	
}