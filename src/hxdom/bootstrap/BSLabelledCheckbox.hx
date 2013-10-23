package hxdom.bootstrap;

import hxdom.Elements;
import js.html.CharacterData;

/**
 * Easy access to a labelled checkbox which is the most common usage.
 * 
 * @author Sam MacPherson
 */
class BSLabelledCheckbox extends EDiv {
	
	public var label(default, set):String;
	public var checkbox(default, null):EInput;
	
	var etext:CharacterData;

	public function new (label:String, ?name:String, ?checked:Bool = false) {
		super();
		
		var elabel = ELabel.create();
		checkbox = EInput.create(Checkbox);
		if (name != null) checkbox.name = name;
		if (checked) checkbox.checked = true;
		etext = Text.create(label);
		this.label = label;
		this.className = "checkbox";
		
		elabel.appendChild(checkbox);
		elabel.appendChild(etext);
		appendChild(elabel);
	}
	
	function set_label (label:String):String {
		this.label = etext.data = label;
		
		return label;
	}
	
}