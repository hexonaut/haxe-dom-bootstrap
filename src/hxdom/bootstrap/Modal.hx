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

import hxdom.bootstrap.Modal.ModalGroup;
import hxdom.Elements;

using hxdom.DomTools;

/**
 * A modal popup. Header/footer will only be added if you access them.
 * 
 * @author Sam MacPherson
 */
class Modal extends EDiv {
	
	@:allow(hxdom.bootstrap.ModalGroup)
	public var group(default, null):Null<ModalGroup>;
	public var header(get, null):EDiv;
	public var body(default, null):EDiv;
	public var footer(get, null):EDiv;
	
	/**
	 * Set whether this modal is visible or not.
	 */
	public var visible(default, set):Bool;
	
	var edialog:EDiv;
	var econtent:EDiv;

	public function new () {
		super();
		
		classes("modal in");
		
		edialog = new EDiv().classes("modal-dialog");
		econtent = new EDiv().classes("modal-content");
		body = new EDiv().classes("modal-body");
		
		econtent.add(body);
		edialog.add(econtent);
		add(edialog);
		
		visible = true;
	}
	
	public function close ():Void {
		if (group != null) group.removeModal(this);
	}
	
	function get_header ():EDiv {
		if (header == null) {
			header = new EDiv();
			header.classes("modal-header");
			econtent.node.insertBefore(header.node, body.node);
		}
		
		return header;
	}
	
	function get_footer ():EDiv {
		if (footer == null) {
			footer = new EDiv();
			footer.classes("modal-footer");
			econtent.add(footer);
		}
		
		return footer;
	}
	
	public function set_visible (visible:Bool):Bool {
		this.visible = visible;
		
		if (group != null) group.updateVisibility();
		if (visible) node.style.display = "block";
		else node.style.display = "none";
		
		return visible;
	}
	
}

/**
 * Provides a common backdrop for an entire group of modals.
 */
class ModalGroup extends EDiv {
	
	public var backdrop(default, null):EDiv;
	public var modals(default, null):Array<Modal>;
	
	public function new () {
		super();
		
		backdrop = new EDiv().classes("modal-backdrop in");
		add(backdrop);
		modals = new Array<Modal>();
		
		updateVisibility();
	}
	
	public function addModal (modal:Modal):ModalGroup {
		modal.group = this;
		modals.push(modal);
		add(modal);
		
		updateVisibility();
		
		return this;
	}
	
	public function removeModal (modal:Modal):ModalGroup {
		remove(modal);
		modals.remove(modal);
		modal.group = null;
		
		updateVisibility();
		
		return this;
	}
	
	@:allow(hxdom.bootstrap.Modal)
	function updateVisibility ():Void {
		//If at least one modal is visible then show this modal group
		node.style.display = "none";
		for (i in modals) {
			if (i.visible) {
				node.style.display = "block";
				break;
			}
		}
	}
	
}