//
//  UIQueryGestureDelegate.h
//  Frank
//
//  Created by Larivain, Olivier on 6/23/11.
//  Copyright 2011 Edmunds. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIQuery;

@interface UIQueryGestureDelegate : NSObject 
{
    UIQuery *parent;
}

- (id) initWithQuery: (UIQuery*) query;

- (void) tap;
- (void) tapAtPoint: (CGPoint) point;

@end
