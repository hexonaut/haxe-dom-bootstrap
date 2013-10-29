package hxdom.bootstrap;

import hxdom.bootstrap.Alert;
import hxdom.Elements;

using hxdom.DomTools;

/**
 * An alert that provides a dismiss button by default.
 * 
 * @author Sam MacPherson
 */
class DismissableAlert extends Alert {

	public function new (?type:AlertType) {
		super(type);
		
		classes("alert-dismissable");
		var btn = CloseButton.create();
		btn.dataset.dismiss = "alert";
		add(btn);
	}
	
}