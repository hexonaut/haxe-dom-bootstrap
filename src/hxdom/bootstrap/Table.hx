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
import hxdom.html.Element;

using hxdom.DomTools;

enum TableOptions {
	Striped;
	Bordered;
	Hover;
	Condensed;
}

enum TableEmphasis {
	Active;
	Success;
	Warning;
	Danger;
}

/**
 * Bootstrap table.
 * 
 * @author Sam MacPherson
 */
class Table extends ETable {

	public function new (?opts:Iterable<TableOptions>) {
		super();
		
		addClass("table");
		
		if (opts != null) setOptions(opts);
	}
	
	public function setOptions (opts:Iterable<TableOptions>):Void {
		node.className = "table";		//Clear previous styles
		
		for (i in opts) {
			addClass(switch (i) {
				case Striped: "table-striped";
				case Bordered: "table-bordered";
				case Hover: "table-hover";
				case Condensed: "table-condensed";
			});
		}
	}
	
	/**
	 * Convienance method for mapping a 2D array of elements to a table.
	 * First row is assumed to be a table header.
	 */
	public static function build (data:Iterable<Iterable<VirtualNode<Dynamic>>>, ?opts:Iterable<TableOptions>) {
		var head = new ETableHeader();
		var body = new ETableBody();
		var firstRow = true;
		for (i in data) {
			var row = new TableRow();
			if (firstRow) {
				for (o in i) row.append(new BSTableHeaderCell().append(o));
				head.append(row);
				firstRow = false;
			} else {
				for (o in i) row.append(new TableCell().append(o));
				body.append(row);
			}
		}
		return new Table(opts).append(head).append(body);
	}
	
}

class TableRow extends ETableRow {
	
	public function new (?emphasis:TableEmphasis) {
		super();
		
		if (emphasis != null) {
			addClass(switch (emphasis) {
				case Active: "active";
				case Success: "success";
				case Warning: "warning";
				case Danger: "danger";
			});
		}
	}
	
}

class BSTableHeaderCell extends ETableHeaderCell {
	
	public function new (?emphasis:TableEmphasis) {
		super();
		
		if (emphasis != null) {
			addClass(switch (emphasis) {
				case Active: "active";
				case Success: "success";
				case Warning: "warning";
				case Danger: "danger";
			});
		}
	}
	
}

class TableCell extends ETableCell {
	
	public function new (?emphasis:TableEmphasis) {
		super();
		
		if (emphasis != null) {
			addClass(switch (emphasis) {
				case Active: "active";
				case Success: "success";
				case Warning: "warning";
				case Danger: "danger";
			});
		}
	}
	
}