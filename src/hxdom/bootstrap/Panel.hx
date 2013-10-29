package hxdom.bootstrap;

import hxdom.Elements;

using hxdom.DomTools;

enum PanelType {
	Default;
	Primary;
	Success;
	Info;
	Warning;
	Danger;
}

/**
 * Provides simple borders, padding, header and footer. By default only the body element is set.
 * If you want a header or a footer then you need to set the appropriate property.
 * 
 * @author Sam MacPherson
 */
class Panel extends EDiv {
	
	public var header(default, set):Null<EDiv>;
	public var body(default, null):EDiv;
	public var footer(default, set):Null<EDiv>;

	public function new (?type:PanelType) {
		super();
		
		if (type == null) type = Default;
		
		classes("panel");
		switch (type) {
			case Default:
			case Primary: classes("panel-primary");
			case Success: classes("panel-success");
			case Info: classes("panel-info");
			case Warning: classes("panel-warning");
			case Danger: classes("panel-danger");
		}
		
		body = EDiv.create().classes("panel-body");
		
		add(body);
	}
	
	/**
	 * Set the header to contain a single title.
	 */
	public function setTitle (title:String):Void {
		header = EDiv.create().add(EHeader3.create().classes("panel-title").addText(title));
	}
	
	function set_header (header:EDiv):EDiv {
		if (this.header != null) removeChild(this.header);
		
		this.header = header;
		
		header.classes("panel-heading");
		this.insertBefore(header, body);
		
		return header;
	}
	
	function set_footer (footer:EDiv):EDiv {
		if (this.footer != null) removeChild(this.footer);
		
		this.footer = footer;
		
		footer.classes("panel-footer");
		appendChild(footer);
		
		return footer;
	}
	
}