/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.bootstrap;

import hxdom.Elements;
import hxdom.html.Element;
import hxdom.html.Event;
import hxdom.html.Node;

using hxdom.BSTools;
using hxdom.DomTools;

typedef TabPane = {
	label:String,
	content:VirtualNode<Dynamic>
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
		
		enav = new EUnorderedList().nav(Tabs);
		econtent = new EDiv().classes("tab-content");
		
		add(enav);
		add(econtent);
		
		if (panes != null) this.panes = panes;
	}
	
	function set_panes (panes:Array<TabPane>):Array<TabPane> {
		for (i in enav.node.childNodes) {
			i.firstChild.removeEventListener("click", onTabSelected);
		}
		enav.clear();
		econtent.clear();
		
		this.panes = panes;
		
		for (i in panes) {
			var anchor = new EAnchor().attr(href, "#").addText(i.label);
			anchor.addEventListener("click", onTabSelected);
			Reflect.setField(anchor, "__content", i.content);
			enav.add(new EListItem().add(anchor));
			i.content.classes("tab-pane");
			econtent.add(i.content);
		}
		
		return panes;
	}
	
	public function clearActive ():Void {
		for (i in enav.node.childNodes) {
			cast(i, Node).vnode().removeClasses("active");
		}
		for (i in econtent.node.childNodes) {
			cast(i, Node).vnode().removeClasses("active");
		}
	}
	
	public function setActive (index:Int):Void {
		clearActive();
		
		cast(enav.node.childNodes[index], Element).vnode().classes("active");
		cast(econtent.node.childNodes[index], Element).vnode().classes("active");
	}
	
	function onTabSelected (e:Event):Void {
		//Remove other tab selections
		clearActive();
		
		var anchor:Element = cast e.currentTarget;
		anchor.parentElement.vnode().classes("active");
		DomTools.classes(Reflect.field(anchor.vnode(), "__content"), "active");
		
		e.preventDefault();
	}
	
}