package hxdom.bootstrap;

import hxdom.Elements;

using hxdom.DomTools;

enum LabelType {
	Default;
	Primary;
	Success;
	Info;
	Warning;
	Danger;
}

/**
 * Highlighted text with a colored background.
 * 
 * @author Sam MacPherson
 */
class Label extends ESpan {

	public function new (txt:String, ?type:LabelType) {
		super();
		
		if (type == null) type = Default;
		
		addText(txt);
		e.classes("label");
		e.classes(switch (type) {
			case Default: "label-default";
			case Primary: "label-primary";
			case Success: "label-success";
			case Info: "label-info";
			case Warning: "label-warning";
			case Danger: "label-danger";
		});
	}
	
}