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
		for (i in enav.childNodes) {
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
		for (i in enav.childNodes) {
			cast(i, Element).removeClasses("active");
		}
		for (i in econtent.childNodes) {
			cast(i, Element).removeClasses("active");
		}
	}
	
	public function setActive (index:Int):Void {
		clearActive();
		
		cast(enav.childNodes[index], Element).classes("active");
		cast(econtent.childNodes[index], Element).classes("active");
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