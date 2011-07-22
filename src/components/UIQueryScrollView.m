
#import "UIQueryScrollView.h"


@implementation UIQueryScrollView

-(UIQuery*)scrollToTop {
    UIScrollView *scroller = (UIScrollView *)self;
	[scroller setContentOffset:CGPointMake(0, 0) animated:YES];
	return [UIQuery withViews:views className:className];
}

-(UIQuery *)scrollDown:(int)offset {
	UIScrollView *scroller = (UIScrollView *)self;
	[scroller setContentOffset:CGPointMake(0,offset) animated:NO];
	return [UIQuery withViews:views className:className];
}

-(UIQuery *)scrollToBottom {
	UIScrollView *scroller = (UIScrollView *)self;
    CGFloat scrollerSize = scroller.contentSize.height;
    CGFloat offset = scrollerSize - scroller.frame.size.height;
	CGPoint endPoint = CGPointMake(0, offset);
	[scroller setContentOffset: endPoint animated: YES];
	return [UIQuery withViews:views className:className];
}

-(UIQuery *)scrollLeft {
    UIScrollView *scroller = (UIScrollView *)self;
    CGFloat offset = scroller.frame.size.width;
	CGPoint endPoint = CGPointMake(scroller.frame.origin.x - offset, 0);
	[scroller setContentOffset: endPoint animated: YES];
	return [UIQuery withViews:views className:className];
}

-(UIQuery *)scrollRight{
    UIScrollView *scroller = (UIScrollView *)self;
    CGFloat offset = scroller.frame.size.width;
	CGPoint endPoint = CGPointMake(scroller.frame.origin.x + offset, 0);
	[scroller setContentOffset: endPoint animated: YES];
	return [UIQuery withViews:views className:className];
}

-(UIQuery *)scrollUp {
    UIScrollView *scroller = (UIScrollView *)self;
    CGFloat offset = scroller.frame.size.height;
	CGPoint endPoint = CGPointMake(0, scroller.frame.origin.y + offset);
	[scroller setContentOffset: endPoint animated: YES];
	return [UIQuery withViews:views className:className];
}

-(UIQuery *)scrollDown{
    UIScrollView *scroller = (UIScrollView *)self;
    CGFloat offset = scroller.frame.size.height;
	CGPoint endPoint = CGPointMake(0, scroller.frame.origin.y - offset);
	[scroller setContentOffset: endPoint animated: YES];
	return [UIQuery withViews:views className:className];
}

@end
