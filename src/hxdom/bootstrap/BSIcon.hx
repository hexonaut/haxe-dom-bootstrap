package hxdom.bootstrap;

import hxdom.Elements;

using hxdom.DomTools;
using StringTools;

enum IconType {
	Adjust;
	AlignCenter;
	AlignJustify;
	AlignLeft;
	AlignRight;
	ArrowDown;
	ArrowLeft;
	ArrowRight;
	ArrowUp;
	Asterisk;
	Backward;
	BanCircle;
	Barcode;
	Bell;
	Bold;
	Book;
	Bookmark;
	Briefcase;
	Bullhorn;
	Calendar;
	Camera;
	Certificate;
	Check;
	ChevronDown;
	ChevronLeft;
	ChevronRight;
	ChevronUp;
	CircleArrowDown;
	CircleArrowLeft;
	CircleArrowRight;
	CircleArrowUp;
	Cloud;
	CloudDownload;
	CloudUpload;
	Cog;
	CollapseDown;
	CollapseUp;
	Comment;
	Compressed;
	CopyrightMark;
	CreditCard;
	Cutlery;
	Dashboard;
	Download;
	DownloadAlt;
	Earphone;
	Edit;
	Eject;
	Envelope;
	Euro;
	ExclamationSign;
	Expand;
	Export;
	EyeClose;
	EyeOpen;
	FacetimeVideo;
	FastBackward;
	FastForward;
	File;
	Film;
	Filter;
	Fire;
	Flag;
	Flash;
	FloppyDisk;
	FloppyOpen;
	FloppyRemove;
	FloppySave;
	FloppySaved;
	FolderClose;
	FolderOpen;
	Font;
	Forward;
	Fullscreen;
	Gbp;
	Gift;
	Glass;
	Globe;
	HandDown;
	HandLeft;
	HandRight;
	HandUp;
	HdVideo;
	Hdd;
	Header;
	Headphones;
	Heart;
	HeartEmpty;
	Home;
	Import;
	Inbox;
	IndentLeft;
	IndentRight;
	InfoSign;
	Italic;
	Leaf;
	Link;
	List;
	ListAlt;
	Lock;
	LogIn;
	LogOut;
	Magnet;
	MapMarker;
	Minus;
	MinusSign;
	Move;
	Music;
	NewWindow;
	Off;
	Ok;
	OkCircle;
	OkSign;
	Open;
	Paperclip;
	Pause;
	Pencil;
	Phone;
	PhoneAlt;
	Picture;
	Plane;
	Play;
	PlayCircle;
	Plus;
	PlusSign;
	Print;
	Pushpin;
	Qrcode;
	QuestionSign;
	Random;
	Record;
	Refresh;
	RegistrationMark;
	Remove;
	RemoveCircle;
	RemoveSign;
	Repeat;
	ResizeFull;
	ResizeHorizontal;
	ResizeSmall;
	ResizeVertical;
	Retweet;
	Road;
	Save;
	Saved;
	Screenshot;
	SdVideo;
	Search;
	Send;
	Share;
	ShareAlt;
	ShoppingCart;
	Signal;
	Sort;
	SortByAlphabet;
	SortByAlphabetAlt;
	SortByAttributes;
	SortByAttributesAlt;
	SortByOrder;
	SortByOrderAlt;
	SoundFivePointOne;
	SoundSixPointOne;
	SoundSevenPointOne;
	SoundDolby;
	SoundStereo;
	Star;
	StarEmpty;
	Stats;
	StepBackward;
	StepForward;
	Stop;
	Subtitles;
	Tag;
	Tags;
	Tasks;
	TextHeight;
	TextWidth;
	Th;
	ThLarge;
	ThList;
	ThumbsDown;
	ThumbsUp;
	Time;
	Tint;
	Tower;
	Transfer;
	Trash;
	TreeConifer;
	TreeDeciduous;
	Unchecked;
	Upload;
	Usd;
	User;
	VolumeDown;
	VolumeOff;
	VolumeUp;
	WarningSign;
	Wrench;
	ZoomIn;
	ZoomOut;
}

/**
 * Glyphicons element.
 * 
 * View icon images here: http://getbootstrap.com/components/#glyphicons-glyphs
 * 
 * @author Sam MacPherson
 */
class BSIcon extends ESpan {

	public function new (type:IconType) {
		super();
		
		classes("glyphicon glyphicon-" + enumToCls(type));
	}
	
	inline function enumToCls (type:IconType):String {
		var typeStr = Std.string(type);
		var glyphStr = "";
		for (i in 0 ... typeStr.length) {
			var chr = typeStr.charCodeAt(i);
			if (i != 0) {
				if (chr >= 'A'.code && chr <= 'Z'.code) {
					glyphStr += '-' + String.fromCharCode(chr - 'A'.code + 'a'.code);
				} else {
					glyphStr += String.fromCharCode(chr);
				}
			} else {
				glyphStr += String.fromCharCode(chr - 'A'.code + 'a'.code);
			}
		}
		return glyphStr;
	}
	
}