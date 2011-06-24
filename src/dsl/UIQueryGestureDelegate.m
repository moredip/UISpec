//
//  UIQueryGestureDelegate.m
//  Frank
//
//  Created by Larivain, Olivier on 6/23/11.
//  Copyright 2011 Edmunds. All rights reserved.
//

#import "UIQueryGestureDelegate.h"

#import "UIQuery.h"
#import "UITouch+Synthesize.h"
#import "UIEvent+Synthesize.h"

@interface UIQueryGestureDelegate()
- (void) tapInView: (UIView*) view;
- (BOOL) isHorizontal: (SwipeDirection) direction;
@end

@implementation UIQueryGestureDelegate

- (id) initWithQuery: (UIQuery*) query
{
    self = [super init];
    if (self)
    {
        // simply assign, we don't want a cycle here.
        parent = query; 
    }
    return self;
}

- (void)tap 
{
    // dispatch a tap to every view in target views
	NSArray *targetViews = [parent targetViews];
    
    for(UIView *targetView in targetViews)
    {
        // create a touch in the center of the view
        UITouch *touch = [UITouch touchInView: targetView];
        
        // init an empty event
        UIEvent *event = [UIEvent eventWithTouch: touch];
        // populate the event
        [event _addGestureRecognizersForView: targetView toTouch: touch];    
        [event updateTimestamp];
        
        // dispatch phase down event
        [[UIApplication sharedApplication] sendEvent: event];
        
        // dispatch phase up
        [touch setPhase:UITouchPhaseEnded];
        [event updateTimestamp];
        [[UIApplication sharedApplication] sendEvent: event];
    }
}

- (void) tapAtPoint: (CGPoint) point
{
    // create a touch in the center of the view
    UITouch *touch = [UITouch touchAtPoint: point];
    
    // init an empty event
    UIEvent *event = [UIEvent eventWithTouch: touch];
    // populate the event
    [event _addGestureRecognizersForView: touch.view toTouch: touch];    
    [event updateTimestamp];
    
    // dispatch phase down event
    [[UIApplication sharedApplication] sendEvent: event];
    
    // dispatch phase up
    [touch setPhase:UITouchPhaseEnded];
    [event updateTimestamp];
    [[UIApplication sharedApplication] sendEvent: event];
}

- (void)swipeAt: (CGPoint) start direction: (SwipeDirection) direction
{
    UITouch *touch = [UITouch touchAtPoint: start];

    UIEvent *event = [UIEvent eventWithTouch: touch];
    [event _addGestureRecognizersForView: touch.view toTouch: touch];
    
    [[UIApplication sharedApplication] sendEvent: event];
        
    for(int i = 0; i < 20; i++)
    {
        // compute new position in view
        CGFloat newX;
        CGFloat newY;
        if([self isHorizontal: direction])
        {
            // will evaluate to -1 for left and 1 for right
            int directionSign = direction - 2;
            newX = start.x + directionSign * i * 20 ;
            newY = start.y + i;
        }
        else
        {
            // evaluates to 1 for down, -1 for up
            int directionSign = direction - 1;
            newX = start.x + i;
            newY = start.y + directionSign * i * 20 ;
        }
        
        CGPoint newLocation = CGPointMake(newX, newY);
        [touch setLocationInWindow: newLocation];
        [touch setPhase: UITouchPhaseMoved];
        
        [event updateTimestamp];
        
        [[UIApplication sharedApplication] sendEvent: event];
    }
    
    [touch setPhase:UITouchPhaseEnded];
    [event updateTimestamp];
    [[UIApplication sharedApplication] sendEvent: event];
}

- (BOOL) isHorizontal: (SwipeDirection) direction
{
    return direction == RIGHT || direction == LEFT;
}

@end
