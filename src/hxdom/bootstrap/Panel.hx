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
 * Provides simple borders, padding, header and footer. Header/footer will only be added if you access them.
 * 
 * @author Sam MacPherson
 */
class Panel extends EDiv {
	
	public var header(get, null):EDiv;
	public var body(default, null):EDiv;
	public var footer(get, null):EDiv;

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
	
	function get_header ():EDiv {
		if (header == null) {
			header = EDiv.create();
			header.classes("panel-heading");
			insertBefore(header, body);
		}
		
		return header;
	}
	
	function get_footer ():EDiv {
		if (footer == null) {
			footer = EDiv.create();
			footer.classes("panel-footer");
			add(footer);
		}
		
		return footer;
	}
	
}