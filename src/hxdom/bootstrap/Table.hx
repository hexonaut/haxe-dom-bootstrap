package hxdom.bootstrap;

import hxdom.Elements;
import hxdom.html.Element;

using hxdom.DomTools;

enum TableOptions {
	Striped;
	Bordered;
	Hover;
	Condensed;
	Responsive;
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
		
		classes("table");
		
		if (opts != null) setOptions(opts);
	}
	
	public function setOptions (opts:Iterable<TableOptions>):Void {
		className = "table";		//Clear previous styles
		
		for (i in opts) {
			classes(switch (i) {
				case Striped: "table-striped";
				case Bordered: "table-bordered";
				case Hover: "table-hover";
				case Condensed: "table-condensed";
				case Responsive: "table-responsive";
			});
		}
	}
	
	/**
	 * Convienance method for mapping a 2D array of objects to a table.
	 * First row is assumed to be a table header.
	 */
	public static function build (data:Iterable<Iterable<Dynamic>>, ?opts:Iterable<TableOptions>) {
		var head = ETableHeader.create();
		var body = ETableBody.create();
		var firstRow = true;
		for (i in data) {
			var row = TableRow.create();
			if (firstRow) {
				for (o in i) row.add(BSTableHeaderCell.create().addText(Std.string(o)));
				head.add(row);
				firstRow = false;
			} else {
				for (o in i) row.add(TableCell.create().addText(Std.string(o)));
				body.add(row);
			}
		}
		return Table.create(opts).add(head).add(body);
	}
	
}

class TableRow extends ETableRow {
	
	public function new (?emphasis:TableEmphasis) {
		super();
		
		if (emphasis != null) {
			classes(switch (emphasis) {
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
			classes(switch (emphasis) {
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
			classes(switch (emphasis) {
				case Active: "active";
				case Success: "success";
				case Warning: "warning";
				case Danger: "danger";
			});
		}
	}
	
}