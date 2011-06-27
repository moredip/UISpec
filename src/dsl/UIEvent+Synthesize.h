//
//  UIEvent+Synthesis.h
//  UIExperiment
//
//  Created by Larivain, Olivier on 6/21/11.
//  Copyright 2011 Edmunds. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIEvent (UIEvent_Synthesize)

+ (id) eventWithTouch: (UITouch *) touch;
- (id)initWithTouch:(UITouch *)touch;
- (void) updateTimestamp;

@end