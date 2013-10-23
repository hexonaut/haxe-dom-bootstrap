package hxdom;

import hxdom.Elements;
import js.html.Element;

using hxdom.DomTools;

enum DeviceSize {
	ExtraSmall;		//< 768px (Phones)
	Small;			//>= 768px (Tablets)
	Medium;			//>= 992px (Desktop)
	Large;			//>= 1200px (Desktop)
}

enum TextAlign {
	Left;
	Center;
	Right;
}

enum TextEmphasis {
	Muted;
	Primary;
	Success;
	Info;
	Warning;
	Danger;
}

enum ValidationState {
	Regular;
	Success;
	Warning;
	Error;
}

enum InputSize {
	Small;
	Medium;
	Large;
}

enum ButtonType {
	Default;
	Primary;
	Success;
	Info;
	Warning;
	Danger;
	Link;
}

enum ButtonSize {
	ExtraSmall;
	Small;
	Medium;
	Large;
}

enum ImageBorder {
	Rounded;
	Circle;
	Thumbnail;
}

/**
 * Convienence methods for using Twitter Bootstrap.
 * 
 * @author Sam MacPherson
 */
class BSTools {
	
	/**
	 * Make this element into a container.
	 */
	public static function container<T:Element> (e:T):T {
		e.classes("container");
		
		return e;
	}
	
	/**
	 * Make this element into a grid row.
	 */
	public static function row<T:Element> (e:T):T {
		e.classes("row");
		
		return e;
	}
	
	/**
	 * Extra small column.
	 */
	public static function xs<T:Element> (e:T, cols:Int):T {
		e.classes("col-xs-" + cols);
		
		return e;
	}
	
	/**
	 * Small column.
	 */
	public static function sm<T:Element> (e:T, cols:Int):T {
		e.classes("col-sm-" + cols);
		
		return e;
	}
	
	/**
	 * Medium column.
	 */
	public static function md<T:Element> (e:T, cols:Int):T {
		e.classes("col-md-" + cols);
		
		return e;
	}
	
	/**
	 * Large column.
	 */
	public static function lg<T:Element> (e:T, cols:Int):T {
		e.classes("col-lg-" + cols);
		
		return e;
	}
	
	/**
	 * Extra small column offset.
	 */
	public static function xsoff<T:Element> (e:T, cols:Int):T {
		e.classes("col-xs-offset-" + cols);
		
		return e;
	}
	
	/**
	 * Small column offset.
	 */
	public static function smoff<T:Element> (e:T, cols:Int):T {
		e.classes("col-sm-offset-" + cols);
		
		return e;
	}
	
	/**
	 * Medium column offset.
	 */
	public static function mdoff<T:Element> (e:T, cols:Int):T {
		e.classes("col-md-offset-" + cols);
		
		return e;
	}
	
	/**
	 * Large column offset.
	 */
	public static function lgoff<T:Element> (e:T, cols:Int):T {
		e.classes("col-lg-offset-" + cols);
		
		return e;
	}
	
	/**
	 * Leading paragraph. Make this one stand out.
	 */
	public static function lead<T:EParagraph> (e:T):T {
		e.classes("lead");
		
		return e;
	}
	
	/**
	 * Text align.
	 */
	public static function textAlign<T:Element> (e:T, align:TextAlign):T {
		e.classes(switch (align) {
			case Left: "text-left";
			case Center: "text-center";
			case Right: "text-right";
		});
		
		return e;
	}
	
	/**
	 * Apply different colors to text for emphasis.
	 */
	public static function emphasis<T:Element> (e:T, type:TextEmphasis):T {
		e.classes(switch (type) {
			case Muted: "text-muted";
			case Primary: "text-primary";
			case Success: "text-success";
			case Info: "text-info";
			case Warning: "text-warning";
			case Danger: "text-danger";
		});
		
		return e;
	}
	
	/**
	 * An abbreviation with a slightly smaller font size.
	 */
	public static function initialism<T:EAbbr> (e:T):T {
		e.classes("initialism");
		
		return e;
	}
	
	/**
	 * Remove default styling from a list.
	 */
	public static function unstyled<T:Element> (e:T):T {
		e.classes("list-unstyled");
		
		return e;
	}
	
	/**
	 * Switch to a horizontal display.
	 * 
	 * Valid for:
	 * 		dl
	 * 		form
	 */
	public static function horizontal<T:Element> (e:T):T {
		e.classes(e.tagName.toLowerCase() + "-horizontal");
		
		return e;
	}
	
	/**
	 * Inline the list.
	 */
	public static function scrollable<T:EPre> (e:T):T {
		e.classes("pre-scrollable");
		
		return e;
	}
	
	/**
	 * Inline display.
	 * 
	 * Valid for:
	 * 		form
	 * 		ul
	 * 		ol
	 * 		input[checkbox]
	 * 		input[radio]
	 */
	public static function inLine<T:Element> (e:T):T {
		e.classes(switch (e.tagName.toLowerCase()) {
			case "form": "form-inline";
			case "ul", "li": "list-inline";
			case "input":
				switch (cast(e, EInput).type.toLowerCase()) {
					case "checkbox": "checkbox-inline";
					case "radio": "radio-inline";
					default: throw "Inline not defined for this type of input.";
				}
			default: throw "Inline not defined for this element.";
		});
		
		return e;
	}
	
	/**
	 * Group multiple elements into one form item.
	 */
	public static function formGroup<T:Element> (e:T):T {
		e.classes("form-group");
		
		return e;
	}
	
	/**
	 * Makes a form element stretch to 100% width.
	 */
	public static function formControl<T:Element> (e:T):T {
		e.classes("form-control");
		
		return e;
	}
	
	/**
	 * Non-editable input.
	 */
	public static function formControlStatic<T:EParagraph> (e:T):T {
		e.classes("form-control-static");
		
		return e;
	}
	
	/**
	 * A help block.
	 */
	public static function help<T:Element> (e:T):T {
		e.classes("help-block");
		
		return e;
	}
	
	/**
	 * Make this element only applicable to screen readers.
	 * Does not display.
	 */
	public static function screenReaderOnly<T:Element> (e:T):T {
		e.classes("sr-only");
		
		return e;
	}
	
	/**
	 * Set this element and all descendants to show the given validation state.
	 * Will remove any previous validation states.
	 */
	public static function validation<T:Element> (e:T, state:ValidationState):T {
		e.removeClasses("has-success has-warning has-error");
		switch (state) {
			case Regular:
			case Success: e.classes("has-success");
			case Warning: e.classes("has-warning");
			case Error: e.classes("has-error");
		};
		
		return e;
	}
	
	/**
	 * Set the size of the input.
	 */
	public static function inputSize<T:Element> (e:T, size:InputSize):T {
		switch (size) {
			case Small: e.classes("input-sm");
			case Medium:
			case Large: e.classes("input-lg");
		};
		
		return e;
	}
	
	/**
	 * Style a button.
	 * 
	 * Valid for:
	 * 		button
	 * 		input[submit]
	 * 		input[button]
	 * 		a
	 */
	public static function button<T:Element> (e:T, type:ButtonType, ?size:ButtonSize):T {
		e.classes("btn");
		e.classes(switch (type) {
			case Default: "btn-default";
			case Primary: "btn-primary";
			case Success: "btn-success";
			case Info: "btn-info";
			case Warning: "btn-warning";
			case Danger: "btn-danger";
			case Link: "btn-link";
		});
		if (size != null) {
			switch (size) {
				case ExtraSmall: e.classes("btn-xs");
				case Small: e.classes("btn-sm");
				case Medium:
				case Large: e.classes("btn-lg");
			}
		}
		
		return e;
	}
	
	/**
	 * Turn an element into block level.
	 * 
	 * Valid for:
	 * 		button
	 * 		input[submit]
	 * 		input[button]
	 * 		a
	 */
	public static function block<T:Element> (e:T):T {
		e.classes("btn-block");
		
		return e;
	}
	
	/**
	 * Set image border style.
	 */
	public static function imageBorder<T:Element> (e:T, border:ImageBorder):T {
		e.classes(switch (border) {
			case Rounded: "img-rounded";
			case Circle: "img-circle";
			case Thumbnail: "img-thumbnail";
		});
		
		return e;
	}
	
	/**
	 * Set image border style.
	 */
	public static function clearfix<T:Element> (e:T):T {
		e.classes("clearfix");
		
		return e;
	}
	
	/**
	 * Set image border style.
	 */
	public static function visible<T:Element> (e:T, size:DeviceSize):T {
		e.classes(switch (size) {
			case ExtraSmall: "visible-xs";
			case Small: "visible-sm";
			case Medium: "visible-md";
			case Large: "visible-lg";
		});
		
		return e;
	}
	
	/**
	 * Set image border style.
	 */
	public static function hidden<T:Element> (e:T, size:DeviceSize):T {
		e.classes(switch (size) {
			case ExtraSmall: "hidden-xs";
			case Small: "hidden-sm";
			case Medium: "hidden-md";
			case Large: "hidden-lg";
		});
		
		return e;
	}
	
}