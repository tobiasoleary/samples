Sample for GitHub Question [Avoiding multiple Scroll when textview is used inside Scrollview ios](http://stackoverflow.com/questions/30359928/avoiding-multiple-scroll-when-textview-is-used-inside-scrollview-ios/30360942?noredirect=1#comment48856510_30360942)

**Here was my answer to the question:**

I believe you're asking how to have just a single scrollable area, basically all the views of the ViewController.

Set your textView's scrollEnabled option to false. It should cause the intrinsic height of the textView to become the height to display all the text, so you'll no longer have a scroll view inside a scrollview. Make sure you don't specify the height of the textView, otherwise it'll cut off the text.

Okay. I've created a demo project with what I think you're looking for.

Here's some explanation.

The scrollView's constraints to it's parent and sibling views define it's frame size.

The constraints from the scrollView's subviews to the scrollView define the contentSize.

With that in mind. Set the scrollView to be centered in it's superview and have the same width and height. (Now the scrollView's frame is defined).

To define the scrollview's contentSize we setup top, leading, trailing, bottom constraints using the scrollView's children. (Now the scrollView's contentSize is created)

If you don't have to have scrolling in the horizontal direction you need to make sure the children's width is less than of equals to the scrollView's superview.

I hope this information helps.