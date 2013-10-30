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
	 * If true then the modal dialog fades in and out.
	 */
	public var fade(default, set):Bool;
	
	var edialog:EDiv;
	var econtent:EDiv;
	var eclose:CloseButton;

	public function new () {
		super();
		
		classes("modal");
		
		edialog = EDiv.create().classes("modal-dialog");
		econtent = EDiv.create().classes("modal-content");
		body = EDiv.create().classes("modal-body");
		
		econtent.add(body);
		edialog.add(econtent);
		add(edialog);
		
		closeable = false;
	}
	
	function get_header ():EDiv {
		if (header == null) {
			header = EDiv.create();
			header.classes("modal-header");
			econtent.insertBefore(header, body);
			
			//Be sure to add in close button first
			if (closeable) {
				eclose = CloseButton.create();
				untyped eclose.dataset.dismiss = "modal";
				header.add(eclose);
			}
		}
		
		return header;
	}
	
	function get_footer ():EDiv {
		if (footer == null) {
			footer = EDiv.create();
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
				eclose = CloseButton.create();
				untyped eclose.dataset.dismiss = "modal";
				header.insertBefore(eclose, header.firstChild);
			}
		} else {
			if (eclose != null) header.removeChild(eclose);
		}
		
		return closeable;
	}
	
	function set_fade (fade:Bool):Bool {
		this.fade = fade;
		
		if (fade) classes("fade");
		else removeClasses("fade");
		
		return fade;
	}
	
	public function setVisible (bool:Bool):Void {
		#if js
		//Using JQuery to perform fade effect -- maybe consider dropping this
		untyped new js.JQuery(this).modal(bool ? "show" : "hide");
		#else
		//Otherwise just set the classes properly
		if (bool) {
			this.style.display = "block";
			if (fade) classes("fade in");
		} else {
			this.style.display = "none";
			if (fade) removeClasses("fade in");
		}
		#end
	}
	
}