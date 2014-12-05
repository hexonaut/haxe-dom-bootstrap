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
		e.addClass("label");
		e.addClass(switch (type) {
			case Default: "label-default";
			case Primary: "label-primary";
			case Success: "label-success";
			case Info: "label-info";
			case Warning: "label-warning";
			case Danger: "label-danger";
		});
	}
	
}