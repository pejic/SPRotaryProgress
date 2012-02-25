/*
 * Copyright (c) 2012 Slobodan Pejic
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "SPProgressView.h"
#import "SPProgressLayer.h"


#ifdef __has_feature
# define OBJC_ARC __has_feature(objc_arc)
#else
# define OBJC_ARC 0
#endif

@implementation SPProgressView

@synthesize showPercent = _showPercent;
@synthesize fillColor = _fillColor;
@synthesize strokeColor = _strokeColor;
@synthesize textColor = _textColor;

+ (id)layerClass
{
	return [SPProgressLayer class];
}

- (void)updateProgress:(id) data
{
	SPProgressLayer* layer = (id) [self layer];
	CGFloat p = layer.progress;
	p += 0.007;
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
	self.showPercent = YES;
	self.fillColor = [UIColor colorWithRed:0.2
					 green:0.2
					  blue:0.2
					 alpha:0.6];
	self.strokeColor = [UIColor colorWithRed:0.75
					   green:0.7
					    blue:0.3
					   alpha:1.0];
	self.textColor = [UIColor whiteColor];
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

- (void)setShowPercent:(BOOL)showPercent
{
	SPProgressLayer* layer = (id) [self layer];
	self->_showPercent = showPercent;
	layer.showPercent = showPercent;
}

#if OBJC_ARC
# define COLOR_SETTER(BIGNAME, SMALLNAME) \
- (void)set ## BIGNAME:(UIColor *)SMALLNAME \
{ \
	_ ## SMALLNAME = SMALLNAME; \
	SPProgressLayer* layer = (id) self.layer; \
	[layer set ## BIGNAME: [SMALLNAME CGColor]]; \
}
#else
# define COLOR_SETTER(BIGNAME, SMALLNAME) \
- (void)set ## BIGNAME:(UIColor *)SMALLNAME \
{ \
	[SMALLNAME retain]; \
	[_ ## SMALLNAME release]; \
	_ ## SMALLNAME = SMALLNAME; \
	SPProgressLayer* layer = (id) self.layer; \
	[layer set ## BIGNAME: [SMALLNAME CGColor]]; \
}
#endif

COLOR_SETTER(FillColor, fillColor)
COLOR_SETTER(StrokeColor, strokeColor)
COLOR_SETTER(TextColor, textColor)


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
