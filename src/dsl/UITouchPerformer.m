//
//  UIQueryGestureDelegate.m
//  Frank
//
//  Created by Larivain, Olivier on 6/23/11.
//  Copyright 2011 Edmunds. All rights reserved.
//

#import "UITouchPerformer.h"

#import "UITouch+Synthesize.h"
#import "UIEvent+Synthesize.h"

#import "VisibleTouch.h"

@interface UITouchPerformer()
- (BOOL) isHorizontal: (SwipeDirection) direction;
-(void) wait:(double)seconds;
@end

@implementation UITouchPerformer

+ (id) touchPerformer
{
    return [[[UITouchPerformer alloc] init] autorelease];
}

#pragma mark - Tapping
- (void) tapOnViews: (NSArray*) views
{
    for(UIView *targetView in views)
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

#pragma mark - Swiping
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

#pragma mark - Pinching

#pragma mark - Legacy
- (void) touchViews: (NSArray*) targetViews atPoint: (CGPoint) point
{
    for (UIView *aView in targetViews) {
		UITouch *aTouch = [[UITouch alloc] initInView:aView xcoord:point.x ycoord:point.y];
        
        // Create a view to display a visible touch on the screen with a center of the touch
        UIView *visibleTouch = [[VisibleTouch alloc] initWithCenter: point];
        [[aView window] addSubview:visibleTouch];
        [[aView window] bringSubviewToFront:visibleTouch];
        
		UIEvent *eventDown = [[NSClassFromString(@"UITouchesEvent") alloc] initWithTouch:aTouch];
		NSSet *touches = [[NSMutableSet alloc] initWithObjects:&aTouch count:1];
		
		[aTouch.view touchesBegan:touches withEvent:eventDown];
        
        // Send event to the gesture recognizers
        for (UIGestureRecognizer *recognizer in [aView gestureRecognizers])
        {
            if(![recognizer respondsToSelector:@selector(touchesBegan:withEvent:)])
            {
                continue;
            }

            [recognizer touchesBegan:touches withEvent:eventDown];
        }
        
        [self wait:.25]; // Pause so touch can be seen
        
		UIEvent *eventUp = [[NSClassFromString(@"UITouchesEvent") alloc] initWithTouch:aTouch];
		[aTouch setPhase:UITouchPhaseEnded];
		
		[aTouch.view touchesEnded:touches withEvent:eventDown];
        
        for (UIGestureRecognizer *recognizer in [aView gestureRecognizers])
        {
            if(![recognizer respondsToSelector:@selector(touchesEnded:withEvent:)])
            {
                continue;
            }

            [recognizer touchesEnded:touches withEvent:eventDown];
        }
        
        [visibleTouch removeFromSuperview];
        [visibleTouch release];
        
		[eventDown release];
		[eventUp release];
		[touches release];
		[aTouch release];
		[self wait:.5];
	}

}

- (void) touch:(NSArray*) targetViews
{
    for (UIView *targetView in targetViews) {
		UITouch *targetTouch = [[UITouch alloc] initInView:targetView];
		UIEvent *eventDown = [[NSClassFromString(@"UITouchesEvent") alloc] initWithTouch:targetTouch];
		NSSet *touches = [NSMutableSet setWithObject: targetTouch];
		
		[targetTouch.view touchesBegan:touches withEvent:eventDown];
		
		[targetTouch setPhase:UITouchPhaseEnded];
		
		[targetTouch.view touchesEnded:touches withEvent:eventDown];
		
		[eventDown release];
		[targetTouch release];
	}
}

-(void) wait:(double)seconds 
{
	CFRunLoopRunInMode(kCFRunLoopDefaultMode, seconds, false);
}

@end
