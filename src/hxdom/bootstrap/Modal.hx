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

using hxdom.DomTools;

/**
 * A modal popup. Header/footer will only be added if you access them.
 * 
 * @author Sam MacPherson
 */
class Modal extends EDiv {

	public var header(get, null):EDiv;
	public var body(default, null):EDiv;
	public var footer(get, null):EDiv;
	
	/**
	 * Set to true to automatically add a close button to the modal.
	 */
	public var closeable(default, set):Bool;
	
	/**
	 * Set to true to prevent clicking the backdrop from closing the modal.
	 */
	public var staticBackdrop(default, set):Bool;
	
	/**
	 * If true then the modal dialog fades in and out.
	 */
	public var fade(default, set):Bool;
	
	var edialog:EDiv;
	var econtent:EDiv;
	var eclose:CloseButton;

	public function new () {
		super();
		
		classes("modal");
		
		edialog = new EDiv().classes("modal-dialog");
		econtent = new EDiv().classes("modal-content");
		body = new EDiv().classes("modal-body");
		
		econtent.add(body);
		edialog.add(econtent);
		add(edialog);
		
		closeable = false;
	}
	
	function get_header ():EDiv {
		if (header == null) {
			header = new EDiv();
			header.classes("modal-header");
			econtent.node.insertBefore(header.node, body.node);
			
			//Be sure to add in close button first
			if (closeable) {
				eclose = new CloseButton();
				untyped eclose.node.dataset.dismiss = "modal";
				header.add(eclose);
			}
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
	
	function set_closeable (closeable:Bool):Bool {
		this.closeable = closeable;
		
		//Make sure header is available
		get_header();
		
		if (closeable) {
			if (eclose == null) {
				eclose = new CloseButton();
				untyped eclose.node.dataset.dismiss = "modal";
				header.node.insertBefore(eclose.node, header.node.firstChild);
			}
		} else {
			if (eclose != null) header.node.removeChild(eclose.node);
		}
		
		return closeable;
	}
	
	function set_staticBackdrop (staticBackdrop:Bool):Bool {
		this.staticBackdrop = staticBackdrop;
		
		untyped node.dataset.backdrop = staticBackdrop ? "static" : "";
		
		return staticBackdrop;
	}
	
	function set_fade (fade:Bool):Bool {
		this.fade = fade;
		
		if (fade) classes("fade");
		else removeClasses("fade");
		
		return fade;
	}
	
	public function setVisible (bool:Bool):Void {
		#if (js && !use_vdom)
		//Using JQuery to perform fade effect -- maybe consider dropping this
		untyped new js.JQuery(this.node).modal(bool ? "show" : "hide");
		#else
		//Otherwise just set the classes properly
		if (bool) {
			node.style.display = "block";
			if (fade) classes("fade in");
		} else {
			node.style.display = "none";
			if (fade) removeClasses("fade in");
		}
		#end
	}
	
}