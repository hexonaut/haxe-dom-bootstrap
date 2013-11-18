/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

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
		ebar = new EDiv().classes("progress-bar");
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
		if (value != null && max != null) {
			var w = value / max;
			
			ebar.node.style.width = (w * 100) + "%";
		}
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