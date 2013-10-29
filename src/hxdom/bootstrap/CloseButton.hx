package hxdom.bootstrap;

import hxdom.Elements;

using hxdom.DomTools;

/**
 * Common close button.
 * 
 * @author Sam MacPherson
 */
class CloseButton extends EButton {

	public function new () {
		super();
		
		type = "button";
		classes("close");
		addText("&times;");
	}
	
}