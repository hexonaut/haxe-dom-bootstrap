package hxdom;

import hxdom.bootstrap.Dropdown;
import hxdom.bootstrap.Icon;
import hxdom.bootstrap.Modal;
import hxdom.Elements;
import hxdom.html.Element;
import hxdom.html.Event;

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

enum ButtonGroupAlign {
	Regular;
	Vertical;
	Justified;
}

enum NavStyle {
	Regular;
	Tabs;
	Pills;
}

enum NavAlign {
	Regular;
	Stacked;
	Justified;
}

enum NavBarStyle {
	Default;
	Inverse;
}

enum NavBarAlign {
	Regular;
	FixedTop;
	FixedBottom;
	StaticTop;
}

enum PaginationSize {
	Small;
	Medium;
	Large;
}

enum WellSize {
	Small;
	Medium;
	Large;
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
			case "ul", "ol": "list-inline";
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
	public static function button<T:Element> (e:T, ?type:ButtonType, ?size:ButtonSize):T {
		if (type == null) type = Default;
		
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
	public static function imageBorder<T:EImage> (e:T, border:ImageBorder):T {
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
	
	/**
	 * Turn an element into a group of buttons.
	 */
	public static function buttonGroup<T:Element>(e:T, ?align:ButtonGroupAlign, ?size:ButtonSize, ?dropup:Bool):T {
		if (align == null) align = Regular;
		
		if (align != null) {
			e.classes(switch (align) {
				case Regular: "btn-group";
				case Vertical: "btn-group-vertical";
				case Justified: "btn-group btn-group-justified";
			});
		}
		if (size != null) {
			switch (size) {
				case ExtraSmall: e.classes("btn-group-xs");
				case Small: e.classes("btn-group-sm");
				case Medium:
				case Large: e.classes("btn-group-lg");
			};
		}
		if (dropup) e.classes("dropup");
		
		return e;
	}
	
	/**
	 * Makes element into a dropdown menu.
	 */
	public static function dropdown<T:Element>(e:T):T {
		e.classes("dropdown");
		
		return e;
	}
	
	/**
	 * Links a button to a toggle the dropdown menu within this button group.
	 */
	public static function dropdownButton<T:Element>(e:T):T {
		e.classes("dropdown-toggle");
		untyped e.dataset.toggle = "dropdown";
		
		return e;
	}
	
	/**
	 * Turns this span element into a caret character.
	 */
	public static function addCaret<T:Element>(e:T):T {
		e.add(ESpan.create().classes("caret"));
		
		return e;
	}
	
	/**
	 * Float left.
	 */
	public static function pullLeft<T:Element>(e:T):T {
		e.classes("pull-left");
		
		return e;
	}
	
	/**
	 * Float right.
	 */
	public static function pullRight<T:Element>(e:T):T {
		e.classes("pull-right");
		
		return e;
	}
	
	/**
	 * Turn this element into a input group.
	 */
	public static function inputGroup<T:Element>(e:T, ?size:InputSize):T {
		if (size == null) size = Medium;
		
		e.classes("input-group");
		switch (size) {
			case Small: e.classes("input-group-sm");
			case Medium: 
			case Large: e.classes("input-group-lg");
		}
		
		return e;
	}
	
	/**
	 * Input group addon.
	 */
	public static function inputGroupAddon<T:Element>(e:T):T {
		e.classes("input-group-addon");
		
		return e;
	}
	
	/**
	 * Input group addon.
	 */
	public static function inputGroupButtonAddon<T:Element>(e:T):T {
		e.classes("input-group-btn");
		
		return e;
	}
	
	/**
	 * Create a navigation list.
	 */
	public static function nav<T:Element>(e:T, ?style:NavStyle, ?align:NavAlign):T {
		e.classes("nav");
		if (style != null) {
			switch (style) {
				case Regular:
				case Tabs: e.classes("nav-tabs");
				case Pills: e.classes("nav-pills");
			}
		}
		if (align != null) {
			switch (align) {
				case Regular:
				case Stacked: e.classes("nav-stacked");
				case Justified: e.classes("nav-justified");
			}
		}
		
		return e;
	}
	
	/**
	 * Primary navigation.
	 */
	public static function navbar<T:ENav>(e:T, ?style:NavBarStyle, ?align:NavBarAlign):T {
		e.classes("navbar");
		if (style != null) {
			e.classes(switch (style) {
				case Default: "navbar-default";
				case Inverse: "navbar-inverse";
			});
		}
		if (align != null) {
			switch (align) {
				case Regular:
				case FixedTop: e.classes("navbar-fixed-top");
				case FixedBottom: e.classes("navbar-fixed-bottom");
				case StaticTop: e.classes("navbar-static-top");
			}
		}
		
		return e;
	}
	
	/**
	 * The website brand.
	 */
	public static function brand<T:Element>(e:T):T {
		e.classes("navbar-brand");
		
		return e;
	}
	
	/**
	 * Add navbar specific classes to the element. Varies based on element type.
	 * 
	 * Valid for:
	 * 		button
	 * 		input[submit]
	 * 		input[button]
	 * 		a
	 * 		ul
	 * 		ol
	 * 		p
	 * 		span
	 */
	public static function navbarElement<T:Element>(e:T):T {
		e.classes(switch (e.tagName.toLowerCase()) {
			case "form": "navbar-form";
			case "ul", "ol": "navbar-nav";
			case "button": "navbar-btn";
			case "a": "navbar-link";
			case "p", "span": "navbar-text";
			case "input":
				switch (cast(e, EInput).type.toLowerCase()) {
					case "submit", "button": "navbar-btn";
					default: throw "Navbar element not defined for this type of input.";
				}
			default: throw "Navbar element not defined for this element.";
		});
		
		return e;
	}
	
	/**
	 * Navbar float left.
	 */
	public static function navbarLeft<T:Element>(e:T):T {
		e.classes("navbar-left");
		
		return e;
	}
	
	/**
	 * Navbar float right.
	 */
	public static function navbarRight<T:Element>(e:T):T {
		e.classes("navbar-right");
		
		return e;
	}
	
	/**
	 * Add an icon to an element.
	 */
	public static function addIcon<T:Element>(e:T, type:IconType):T {
		e.add(Icon.create(type));
		
		return e;
	}
	
	/**
	 * Turn a list into breadcrumbs.
	 * 
	 * Valid for:
	 * 		ul
	 * 		ol
	 */
	public static function breadcrumbs<T:Element>(e:T):T {
		e.classes("breadcrumb");
		
		return e;
	}
	
	/**
	 * The active element in a list.
	 */
	public static function active<T:EListItem>(e:T):T {
		e.classes("active");
		
		return e;
	}
	
	/**
	 * Disable an element. Behaviour varies depending on the element.
	 */
	public static function disabled<T:Element>(e:T):T {
		switch (e.tagName.toLowerCase()) {
			case "button", "command", "fieldset", "input", "keygen", "optgroup", "option", "select", "textarea": e.unsafeAttr(hxdom.Attr.disabled, true);
			default: e.classes("disabled");
		}
		
		return e;
	}
	
	/**
	 * Turn a list into pagination.
	 * 
	 * Valid for:
	 * 		ul
	 * 		ol
	 */
	public static function pagination<T:Element>(e:T, ?size:PaginationSize):T {
		e.classes("pagination");
		if (size != null) {
			switch (size) {
				case Small: e.classes("pagination-sm");
				case Medium: 
				case Large: e.classes("pagination-lg");
			}
		}
		
		return e;
	}
	
	/**
	 * Turns a list into a pager.
	 * 
	 * Valid for:
	 * 		ul
	 * 		ol
	 */
	public static function pager<T:Element>(e:T):T {
		e.classes("pager");
		
		return e;
	}
	
	/**
	 * The previous link in a pager.
	 */
	public static function previous<T:EListItem>(e:T):T {
		e.classes("previous");
		
		return e;
	}
	
	/**
	 * The next link in a pager.
	 */
	public static function next<T:EListItem>(e:T):T {
		e.classes("next");
		
		return e;
	}
	
	/**
	 * Call extra attention to this element by making it HUGE.
	 */
	public static function jumbotron<T:Element>(e:T):T {
		e.classes("jumbotron");
		
		return e;
	}
	
	/**
	 * Often used on the title of an article or page.
	 */
	public static function pageHeader<T:Element>(e:T):T {
		e.classes("page-header");
		
		return e;
	}
	
	/**
	 * Turn an element into a thumbnail.
	 */
	public static function thumbnail<T:Element>(e:T):T {
		e.classes("thumbnail");
		
		return e;
	}
	
	/**
	 * Match the color of the parent alert container.
	 */
	public static function alertLink<T:EAnchor>(e:T):T {
		e.classes("alert-link");
		
		return e;
	}
	
	/**
	 * Put the element in a well.
	 */
	public static function well<T:Element>(e:T, ?size:WellSize):T {
		e.classes("well");
		if (size != null) {
			switch (size) {
				case Small: e.classes("well-sm");
				case Medium:
				case Large: e.classes("well-lg");
			}
		}
		
		return e;
	}
	
	/**
	 * Link a button to a modal popup.
	 */
	public static function linkModal<T:Element>(e:T, modal:Modal):T {
		untyped {
			//Link DOM element to modal
			e.__modal = modal;
		}
		//Weird typing error with macro -- just use the serializable version for non-js
		#if js
		e.addEventListener("click", _doPopup);
		#else
		e.__addEventListener("hxdom.BSTools", "click", "_doPopup");
		#end
		
		return e;
	}
	
	static function _doPopup (e:Event):Void {
		untyped {
			e.currentTarget.__modal.setVisible(true);
		}
	}
	
}