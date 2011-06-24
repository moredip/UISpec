//
//  UIQueryGestureDelegate.h
//  Frank
//
//  Created by Larivain, Olivier on 6/23/11.
//  Copyright 2011 Edmunds. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIQuery;

typedef enum SwipeDirection
{
    UP = 0,
    LEFT = 1,
    DOWN = 2,
    RIGHT = 3
} SwipeDirection;

@interface UIQueryGestureDelegate : NSObject 
{
    UIQuery *parent;
}

- (id) initWithQuery: (UIQuery*) query;

- (void) tap;
- (void) tapAtPoint: (CGPoint) point;
- (void)swipeAt: (CGPoint) start direction: (SwipeDirection) direction;
@end
