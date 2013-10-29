package hxdom.bootstrap;

import hxdom.Elements;

using hxdom.DomTools;

/**
 * Displays a number that represents unread messages, notifications, etc.
 * 
 * @author Sam MacPherson
 */
class Badge extends ESpan {
	
	public var value(default, set):Void;

	public function new (value:Int) {
		super();
		
		this.value = value;
	}
	
	function set_value (value:Int):Int {
		this.value = value;
		
		setText(Std.string(value));
		
		return value;
	}
	
}