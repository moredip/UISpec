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
        [event updateTimestamp];
        // populate the event
        [event _addGestureRecognizersForView: targetView toTouch: touch];    
        
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

@end
