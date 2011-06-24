//
//  UIQueryGestureDelegate.h
//  Frank
//
//  Created by Larivain, Olivier on 6/23/11.
//  Copyright 2011 Edmunds. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum SwipeDirection
{
    UP = 0,
    LEFT = 1,
    DOWN = 2,
    RIGHT = 3
} SwipeDirection;

@interface UITouchPerformer : NSObject 
{
}

+ (id) touchPerformer;

// touches given views in their center.
// This method is deprecated, it exists solely for backward compatibility with existing code.
// Beware that it'll work only in very limited case, as it is invoking directly
// touchesBegan/touchesEnded
- (void) touch: (NSArray*) views;
- (void) touchViews: (NSArray*) views atPoint: (CGPoint) point;

// gesture support

// Taps all views contained in views array. The touch point is the center of the view.
- (void) tapOnViews: (NSArray*) views;

// taps the screen at the given point, in window coordinates
- (void) tapAtPoint: (CGPoint) point;

// swipes the screen in given direction, starting at start point (window coordinates)
- (void)swipeAt: (CGPoint) start direction: (SwipeDirection) direction;
@end
