package ;

import hxdom.bootstrap.Icon;
import hxdom.bootstrap.LabelledCheckbox;
import hxdom.bootstrap.Table;
import hxdom.Elements;
import js.Browser;

using hxdom.BSTools;
using hxdom.DomTools;

/**
 * Testing for bootstrap.
 * 
 * @author Sam MacPherson
 */

class Main {
	
	static function main () {
		var body = Browser.document.body;
		
		var cont = EDiv.create().container();
		
		var col1 = EDiv.create().md(4).add(EHeader1.create().setText("Col 1"))
		.add(EParagraph.create().textAlign(Right).lead().addText("Lorem ipsum dolor sit amet, consectetur adipiscing elit."))
		.add(EParagraph.create().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var col2 = EDiv.create().md(8).add(EHeader1.create().setText("Col 2"))
		.add(EParagraph.create().emphasis(Warning).addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."))
		.add(EPre.create().scrollable().addText("Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi. Fusce ultrices risus in quam dapibus iaculis. Quisque non scelerisque nisi, sed pharetra sapien. Aenean ipsum sapien, accumsan ut pretium sed, mollis eget mauris. Integer vel arcu sit amet nunc tincidunt consectetur. Suspendisse enim nisl, faucibus eu auctor at, porttitor vel magna. Ut feugiat lorem eget massa vulputate faucibus. In nisi odio, eleifend in vulputate aliquam, accumsan eget nisi."));
		
		var table = Table.build([["Head1", "Head2", "Head3"], [1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6], [1, 2, 3], [4, 5, 6]], [Hover, Striped]);
		
		var form = EForm.create()
		.add(LabelledCheckbox.create("A common checkbox", "asdf", true))
		.add(LabelledCheckbox.create("An unchecked checkbox"))
		;
		
		cont.add(col1).add(col2).add(table).add(form);
		for (i in Type.allEnums(IconType)) {
			cont.add(Icon.create(i));
		}
		body.add(cont);
	}
	
}