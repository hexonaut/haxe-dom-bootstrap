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
		
		classes("dropdown-menu");
	}
	
	public function addItem (e:VirtualNode<Dynamic>):Dropdown {
		add(new EListItem().add(e));
		
		return this;
	}
	
	public function addDivider ():Dropdown {
		add(new EListItem().classes("divider"));
		
		return this;
	}
	
	public function addHeader (label:String):Dropdown {
		add(new EListItem().classes("dropdown-header").addText(label));
		
		return this;
	}
	
	public function addLink (url:String, label:String):Dropdown {
		addItem(new EAnchor().attr(Href, url).addText(label));
		
		return this;
	}
	
}