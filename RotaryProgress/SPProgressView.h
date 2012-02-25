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

#import <UIKit/UIKit.h>

@interface SPProgressView : UIView

/**
 * When showPercent is true, then the progress is displayed as a percentage
 * in the middle of the progress view.  If showPercent is false, then the
 * percentage is not displayed.
 */
@property (nonatomic, assign) BOOL showPercent;

/**
 * The color of the background circle.
 */
@property (nonatomic, retain) UIColor *fillColor;

/**
 * The color of the circular progress indicator.
 */
@property (nonatomic, retain) UIColor *strokeColor;

/**
 * The color of the percentage text.
 */
@property (nonatomic, retain) UIColor *textColor;

@end
