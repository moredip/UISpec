//
//  UIQueryScrollView.h
//  UISpec
//

#import "UIQuery.h"

@interface UIQueryScrollView : UIQuery {
    
}

/**
 @brief Scroll to the top of content within the scrollView
 */
-(UIQuery*)scrollToTop;

/** 
 @deprecated In favour of scrollVertically:
 */
-(UIQuery *)scrollDown:(int)offset;

/**
 @brief Scroll to the bottom of content with the scrollView
 */
-(UIQuery *)scrollToBottom;

/** 
 @brief Scroll vertically by offset value
 
 @param offset - amount to scroll by (can be a negative value)
 */
-(UIQuery *)scrollVertically:(int)offset;

/** 
 @brief Scroll horizontally by offset value
 
 @param offset - amount to scroll by (can be a negative value)
 */
-(UIQuery *)scrollHorizontally:(int)offset;

/**
 @brief Scroll left by width of scrollView
 */
-(UIQuery *)scrollLeft;

/**
 @brief Scroll right by width of scrollView
 */
-(UIQuery *)scrollRight;

/**
 @brief Scroll up by height of scrollView
 */
-(UIQuery *)scrollUp;

/**
 @brief Scroll down by height of scrollView
 */
-(UIQuery *)scrollDown;

/** 
 @brief Scroll horizontally by offset value
 
 @param offsetPoint - x & y offset point to scroll by (x or y can be a negative value)
 */
-(UIQuery *)scroll:(CGPoint)offsetPoint;

/* TODO unimplemented UIAutomation API methods that could be useful
 -(UIQuery *)scrollToElementWithName;
 -(UIQuery *)scrollToElementWithPredicate;
 -(UIQuery *)scrollToElementWithValueForKey;
 */

@end
