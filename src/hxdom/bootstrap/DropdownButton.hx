package hxdom.bootstrap;

import hxdom.Elements;
import hxdom.BSTools;
import hxdom.html.Element;
import hxdom.html.Node;

using hxdom.DomTools;
using hxdom.BSTools;

/**
 * Standard button with dropdown.
 * 
 * @author Sam MacPherson
 */
class DropdownButton extends EDiv {
	
	public var dropdown(default, null):Dropdown;

	public function new (label:String, ?type:ButtonType, ?align:ButtonGroupAlign, ?size:ButtonSize) {
		super();
		
		buttonGroup(align, size);
		dropdown = Dropdown.create();
		
		add(EButton.create().button(type).dropdownButton().addText(label + " ").addCaret());
		add(dropdown);
	}
	
}