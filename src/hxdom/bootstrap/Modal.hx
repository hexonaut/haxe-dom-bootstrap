package hxdom.bootstrap;

import hxdom.Elements;
import js.JQuery;

using hxdom.DomTools;

/**
 * A modal popup.
 * 
 * @author Sam MacPherson
 */
class Modal extends EDiv {

	public var header(default, set):Null<EDiv>;
	public var body(default, null):EDiv;
	public var footer(default, set):Null<EDiv>;
	
	/**
	 * Set to true to automatically add a close button to the modal.
	 */
	public var closeable(default, set):Bool;
	
	var edialog:EDiv;
	var econtent:EDiv;
	var eclose:CloseButton;

	public function new (?fade:Bool = false) {
		super();
		
		classes("modal");
		if (fade) classes("fade");
		
		closeable = false;
		
		edialog = EDiv.create().classes("modal-dialog");
		econtent = EDiv.create().classes("modal-content");
		body = EDiv.create().classes("modal-body");
		
		econtent.add(body);
		edialog.add(econtent);
		add(edialog);
	}
	
	function set_header (header:EDiv):EDiv {
		if (this.header != null) econtent.removeChild(this.header);
		
		this.header = header;
		
		//Be sure to add in close button first
		if (closeable) {
			eclose = CloseButton.create();
			untyped eclose.dataset.dismiss = "modal";
			header.add(eclose);
		}
		
		header.classes("modal-header");
		econtent.insertBefore(header, body);
		
		return header;
	}
	
	function set_footer (footer:EDiv):EDiv {
		if (this.footer != null) econtent.removeChild(this.footer);
		
		this.footer = footer;
		
		footer.classes("modal-footer");
		econtent.appendChild(footer);
		
		return footer;
	}
	
	function set_closeable (closeable:Bool):Bool {
		this.closeable = closeable;
		
		if (closeable) {
			eclose = CloseButton.create();
			untyped eclose.dataset.dismiss = "modal";
			if (header != null) {
				header.insertBefore(eclose, header.firstChild);
			} else {
				header = EDiv.create();
				header.add(eclose);
			}
		} else {
			if (header != null && eclose != null) {
				header.removeChild(eclose);
			}
		}
		
		return closeable;
	}
	
	public function setVisible (bool:Bool):Void {
		untyped new JQuery(this).modal(bool ? "show" : "hide");
	}
	
	public function setTitle (title:String):Void {
		header = EDiv.create();
		header.add(EHeader4.create().addText(title));
	}
	
}