//
//  UIQueryScrollView.h
//  UISpec
//

#import "UIQuery.h"

@interface UIQueryScrollView : UIQuery {

}

-(UIQuery*)scrollToTop;
-(UIQuery *)scrollDown:(int)offset;
-(UIQuery *)scrollToBottom;

-(UIQuery *)scrollLeft;
-(UIQuery *)scrollRight;
-(UIQuery *)scrollUp;
-(UIQuery *)scrollDown;

/* UIAutomation API methods unimplemented
 -(UIQuery *)scrollToElementWithName;
 -(UIQuery *)scrollToElementWithPredicate;
 -(UIQuery *)scrollToElementWithValueForKey;
 */

@end
