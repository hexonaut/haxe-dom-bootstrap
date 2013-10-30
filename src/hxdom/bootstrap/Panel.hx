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

enum PanelType {
	Default;
	Primary;
	Success;
	Info;
	Warning;
	Danger;
}

/**
 * Provides simple borders, padding, header and footer. Header/footer will only be added if you access them.
 * 
 * @author Sam MacPherson
 */
class Panel extends EDiv {
	
	public var header(get, null):EDiv;
	public var body(default, null):EDiv;
	public var footer(get, null):EDiv;

	public function new (?type:PanelType) {
		super();
		
		if (type == null) type = Default;
		
		classes("panel");
		switch (type) {
			case Default:
			case Primary: classes("panel-primary");
			case Success: classes("panel-success");
			case Info: classes("panel-info");
			case Warning: classes("panel-warning");
			case Danger: classes("panel-danger");
		}
		
		body = EDiv.create().classes("panel-body");
		
		add(body);
	}
	
	function get_header ():EDiv {
		if (header == null) {
			header = EDiv.create();
			header.classes("panel-heading");
			insertBefore(header, body);
		}
		
		return header;
	}
	
	function get_footer ():EDiv {
		if (footer == null) {
			footer = EDiv.create();
			footer.classes("panel-footer");
			add(footer);
		}
		
		return footer;
	}
	
}