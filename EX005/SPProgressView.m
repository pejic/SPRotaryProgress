//
//  SPProgressView.m
//  EX005
//
//  Created by Slobodan Pejic on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SPProgressView.h"
#import "SPProgressLayer.h"

@implementation SPProgressView

+ (id)layerClass
{
	return [SPProgressLayer class];
}

- (void)updateProgress:(id) data
{
	SPProgressLayer* layer = (id) [self layer];
	CGFloat p = layer.progress;
	p += 0.01;
	if (p > 1.0) {
		p -= 1.0;
	}
	layer.progress = p;
	[layer setNeedsDisplay];
}

- (void)__shared_init
{
	[NSTimer scheduledTimerWithTimeInterval:1.0/60.0
					 target:self
				       selector:@selector(updateProgress:)
				       userInfo:nil
					repeats:YES];
	self.opaque = NO;
	self.backgroundColor = [UIColor clearColor];
	self.layer.contentsScale = [UIScreen mainScreen].scale;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		[self __shared_init];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self __shared_init];
	}
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
