package hxdom.bootstrap;

import hxdom.Elements;

using hxdom.DomTools;

enum AlertType {
	Default;
	Success;
	Info;
	Danger;
	Warning;
}

/**
 * Contextual feedback messages for typical user actions.
 * 
 * @author Sam MacPherson
 */
class Alert extends EDiv {

	public function new (?type:AlertType) {
		super();
		
		if (type == null) type = Default;
		
		classes("alert");
		switch (type) {
			case Default:
			case Success: classes("alert-success");
			case Info: classes("alert-info");
			case Danger: classes("alert-danger");
			case Warning: classes("alert-warning");
		}
	}
	
}