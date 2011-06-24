//
//  UTouch+Synthesize.h
//  Frank
//
//  Created by Larivain, Olivier on 6/23/11.
//  Copyright 2011 Edmunds. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UITouch (UTouch_Synthesize)

+ (id) touchInView: (UIView*) view;
+ (id) touchAtPoint: (CGPoint) point;

- (id)initInView:(UIView *)view;
- (id)initInView:(UIView *)view xcoord:(int)x ycoord:(int)y;

- (void)setPhase:(UITouchPhase)phase;
- (void)setLocationInWindow:(CGPoint)location;

@end
