//
//  SPProgressLayer.m
//  RotaryProgress
//
//  Created by Slobodan Pejic on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SPProgressLayer.h"
#import <UIKit/UIStringDrawing.h>

@implementation SPProgressLayer

@synthesize progress = _progress;
@synthesize showPercent = _showPercent;
@synthesize fillColor = _fillColor;
@synthesize strokeColor = _strokeColor;
@synthesize textColor = _textColor;

- (void)__shared_init
{
	[self setNeedsDisplayOnBoundsChange: YES];
	self.progress = 0.0;
}

- (id)init
{
	self = [super init];
	if (self) {
		[self __shared_init];
	}
	return (self);
}

- (id)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder: coder];
	if (self) {
		[self __shared_init];
	}
	return self;
}

- (void)drawInContext:(CGContextRef)g
{
	CGMutablePathRef path = CGPathCreateMutable();
	CGRect bounds = [self bounds];
	CGFloat size = bounds.size.width < bounds.size.height
			? bounds.size.width : bounds.size.height;
	CGFloat size2 = size/2;
	CGPoint c = CGPointMake(bounds.size.width/2, bounds.size.height/2);
	CGFloat sa = -M_PI_2;
	CGFloat ea = 3*M_PI_2;
	if (self.progress < 0.5) {
		CGFloat p = self.progress / 0.5;
		ea = ea * p + sa * (1-p);
	}
	else {
		CGFloat p = (self.progress - 0.5) / 0.5;
		sa = ea * p + sa * (1-p);
	}
	
	// background
	CGPathAddArc(path, NULL, c.x, c.y, size2, 0, 2*M_PI, FALSE);
	
	CGContextBeginPath(g);
	CGContextAddPath(g, path);
	
	CGContextSetRGBFillColor(g, 0.2, 0.2, 0.2, 0.6);
	CGContextSetFillColorWithColor(g, _fillColor);
	CGContextFillPath(g);
	
	
	CGPathRelease(path);
	path = CGPathCreateMutable();
	
	// progress arc
	CGPathAddArc(path, NULL, c.x, c.y, 3.0/4.0 * size2, sa, ea, FALSE);
	
	CGContextBeginPath(g);
	CGContextAddPath(g, path);
	
	CGContextSetLineWidth(g, size2/8.0);
	CGContextSetStrokeColorWithColor(g, _strokeColor);
	CGContextStrokePath(g);
	
	CFRelease(path);

	if (_showPercent) {
		CGContextSelectFont(g, "Helvetica", 12, kCGEncodingMacRoman);
		UIFont *font = [UIFont fontWithName:@"Helvetica"
					       size:12.0];
		CGContextSetTextDrawingMode(g, kCGTextFill);
		CGContextSetFillColorWithColor(g, _textColor);
		CGAffineTransform tt = CGContextGetTextMatrix(g);
		tt = CGAffineTransformTranslate(tt, 0, bounds.size.height);
		tt = CGAffineTransformScale(tt, 1, -1);
		CGContextSetTextMatrix(g, tt);
		char buff[24] = "";
		int percent = (int)(_progress * 100 + 0.5);
		sprintf(buff, "%d%%", percent);
		NSString *nsbuff = [NSString
			stringWithCString:buff
				 encoding:NSASCIIStringEncoding];
		CGSize size = [nsbuff sizeWithFont:font];
		CGContextShowTextAtPoint(g, c.x-size.width+14, c.y+6,
					 buff, strlen(buff));
	}
}

@end
