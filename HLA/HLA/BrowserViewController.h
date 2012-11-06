//
//  ViewController.h
//  JTRevealSidebarDemo
//
//  Created by James Apple Tang on 7/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTRevealSidebarV2Delegate.h"
#import <Cordova/CDVViewController.h>

// Orientation changing is not an officially completed feature,
// The main thing to fix is the rotation animation and the
// necessarity of the container created in AppDelegate. Please let
// me know if you've got any elegant solution and send me a pull request!
// You can change EXPERIEMENTAL_ORIENTATION_SUPPORT to 1 for testing purpose
#define EXPERIEMENTAL_ORIENTATION_SUPPORT 1

@class SidebarViewController;

@interface BrowserViewController : UIViewController <JTRevealSidebarV2Delegate, UITableViewDelegate> {
    CDVViewController* browserController;
#if EXPERIEMENTAL_ORIENTATION_SUPPORT
    CGPoint _containerOrigin;
#endif
}

@property (nonatomic, strong) SidebarViewController *leftSidebarViewController;
@property (nonatomic, strong) NSIndexPath *leftSelectedIndexPath;
//@property (nonatomic, strong) UITableView *rightSidebarView;
//@property (nonatomic, strong) UILabel     *label;

@end