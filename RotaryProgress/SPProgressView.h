//
//  SPProgressView.h
//  RotaryProgress
//
//  Created by Slobodan Pejic on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

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
