
#import "UIQueryScrollView.h"


@implementation UIQueryScrollView

-(UIQuery*)scrollToTop {
    return [self scroll:CGPointMake(0, 0)];
}

-(UIQuery *)scrollDown:(int)offset {
    return [self scrollVertically:offset];
}

-(UIQuery *)scrollToBottom {
	UIScrollView *scroller = (UIScrollView *)self;
    CGFloat scrollerSize = scroller.contentSize.height;
    CGFloat offset = scroller.frame.size.height;
	return [self scroll:CGPointMake(0,scrollerSize - offset)];
}

-(UIQuery *)scrollVertically:(int)offset{
    return [self scroll:CGPointMake(0,offset)];
}

-(UIQuery *)scrollHorizontally:(int)offset{
    return [self scroll:CGPointMake(offset,0)];
}

-(UIQuery *)scrollLeft {
    UIScrollView *scroller = (UIScrollView *)self;
    CGFloat offset = scroller.frame.size.width;
    return [self scrollHorizontally:scroller.frame.origin.x - offset];
}

-(UIQuery *)scrollRight {
    UIScrollView *scroller = (UIScrollView *)self;
    CGFloat offset = scroller.frame.size.width;
	return [self scrollHorizontally:scroller.frame.origin.x + offset];
}

-(UIQuery *)scrollUp {
    UIScrollView *scroller = (UIScrollView *)self;
    CGFloat offset = scroller.frame.size.height;
    return [self scrollVertically:scroller.frame.origin.y + offset];
}

-(UIQuery *)scrollDown{
    UIScrollView *scroller = (UIScrollView *)self;
    CGFloat offset = scroller.frame.size.height;
    return [self scrollVertically:scroller.frame.origin.y - offset];
}


-(UIQuery*)scroll:(CGPoint)offsetPoint {
    UIScrollView *scroller = (UIScrollView *)self;
	[scroller setContentOffset:offsetPoint animated:YES];
	return [UIQuery withViews:views className:className];
}

@end
