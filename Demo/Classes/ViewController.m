//
//  SVProgressHUDViewController.m
//  SVProgressHUD
//
//  Created by Sam Vermette on 27.03.11.
//  Copyright 2011 Sam Vermette. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"

@implementation ViewController

@synthesize segmentedControl;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

#pragma mark -
#pragma mark Show Methods Sample

- (SVProgressHUDMaskType)selectedMaskType {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 1:     return SVProgressHUDMaskTypeClear;
        case 2:     return SVProgressHUDMaskTypeBlack;
        case 3:     return SVProgressHUDMaskTypeGradient;
        default:    return SVProgressHUDMaskTypeNone;
    }
}

- (void)show {
    //[SVProgressHUD showInView:self.view];
    
    SVProgressHUDMaskType maskType = [self selectedMaskType];
    
    if (maskType == SVProgressHUDMaskTypeNone) {
        [SVProgressHUD showInView:self.view];
    }
    else {
        // auto-dismiss
        [SVProgressHUD showInView:self.view status:nil networkIndicator:NO posY:-1 maskType:maskType];
        [SVProgressHUD performSelector:@selector(dismiss) withObject:nil afterDelay:1];
    }
}

- (void)showWithStatus {
    //[SVProgressHUD showInView:self.view];
    
    SVProgressHUDMaskType maskType = [self selectedMaskType];
    
    if (maskType == SVProgressHUDMaskTypeNone) {
        [SVProgressHUD showInView:self.view status:@"Doing Stuff"];
    }
    else {
        // auto-dismiss
        [SVProgressHUD showInView:self.view status:@"Doing Stuff" networkIndicator:NO posY:-1 maskType:maskType];
        [SVProgressHUD performSelector:@selector(dismiss) withObject:nil afterDelay:1];
    }
}

#pragma mark -
#pragma mark Dismiss Methods Sample

- (void)dismiss {
	[SVProgressHUD dismiss];
}

- (void)dismissSuccess {
	[SVProgressHUD dismissWithSuccess:@"Great Success!"];
}

- (void)dismissError {
	[SVProgressHUD dismissWithError:@"Failed with Error"];
}

@end
