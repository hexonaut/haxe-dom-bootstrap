package hxdom.bootstrap;

import hxdom.Elements;

using hxdom.DomTools;

enum ProgressBarType {
	Default;
	Success;
	Info;
	Warning;
	Danger;
}

enum ProgressBarStriped {
	Normal;
	Striped;
	Animated;
}

/**
 * A progress bar element.
 * 
 * @author Sam MacPherson
 */
class ProgressBar extends EDiv {
	
	/**
	 * The value of this progress bar.
	 */
	public var value(default, set):Float;
	
	/**
	 * The max value of this progress bar.
	 */
	public var max(default, set):Float;
	
	var ebar:EDiv;
	
	public function new (?value:Float = 0.0, ?max:Float = 1.0, ?type:ProgressBarType, ?striped:ProgressBarStriped) {
		super();
		
		if (type == null) type = Default;
		if (striped == null) striped = Normal;
		
		classes("progress");
		ebar = EDiv.create().classes("progress-bar");
		switch (type) {
			case Default:
			case Success: ebar.classes("progress-bar-success");
			case Info: ebar.classes("progress-bar-info");
			case Warning: ebar.classes("progress-bar-warning");
			case Danger: ebar.classes("progress-bar-danger");
		}
		switch (striped) {
			case Normal:
			case Striped: classes("progress-striped");
			case Animated: classes("progress-striped active");
		}
		
		this.value = value;
		this.max = max;
		
		add(ebar);
	}
	
	function refresh ():Void {
		var w = value / max;
		
		ebar.style.width = (w*100) + "%";
	}
	
	function set_value (value:Float):Float {
		this.value = value;
		
		refresh();
		
		return value;
	}
	
	function set_max (max:Float):Float {
		this.max = max;
		
		refresh();
		
		return max;
	}
	
}