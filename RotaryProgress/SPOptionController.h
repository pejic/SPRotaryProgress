//
//  SPOptionController.h
//  RotaryProgress
//
//  Created by Slobodan Pejic on 12-02-15.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPProgressView.h"

@interface SPOptionController : UIViewController

@property (nonatomic, assign) IBOutlet SPProgressView* pview;

/**
 * To set the showPercent property via a switch.
 */
- (IBAction)showPercentSet:(id)sender;

@end
