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

- (void) tapOnViews: (NSArray*) views;
- (void) tapAtPoint: (CGPoint) point;
- (void)swipeAt: (CGPoint) start direction: (SwipeDirection) direction;
@end
