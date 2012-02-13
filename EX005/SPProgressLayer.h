//
//  SPProgressLayer.h
//  EX005
//
//  Created by Slobodan Pejic on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface SPProgressLayer : CALayer

/**
 * A number in the range [0, 1] that controls the size of the progress arc.
 */
@property (nonatomic, assign) CGFloat progress;

/**
 * Custom drawing.
 */
- (void)drawInContext:(CGContextRef)ctx;

@end
