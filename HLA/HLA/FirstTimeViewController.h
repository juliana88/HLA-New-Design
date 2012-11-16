//
//  FirstTimeViewController.h
//  HLA Ipad
//
//  Created by Md. Nazmus Saadat on 10/1/12.
//  Copyright (c) 2012 InfoConnect Sdn Bhd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "SecurityQuesTbViewController.h"

@interface FirstTimeViewController : UIViewController<UITextFieldDelegate>{
    NSString *databasePath;
    sqlite3 *contactDB;
    UITextField *activeField;
    UIPopoverController *popOverConroller;
    BOOL selectOne;
    BOOL selectTwo;
    BOOL selectThree;
}
@property (nonatomic, assign,readwrite) int userID;
@property (weak, nonatomic) IBOutlet UITextField *txtOldPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtNewPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPassword;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCancel;
- (IBAction)ActionCancel:(id)sender;
- (IBAction)btnSave:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIButton *outletSave;


-(void)keyboardDidShow:(NSNotificationCenter *)notification;
-(void)keyboardDidHide:(NSNotificationCenter *)notification;

@property (nonatomic,copy) NSString *questOneCode;
@property (nonatomic,copy) NSString *questTwoCode;
@property (nonatomic,copy) NSString *questThreeCode;
@property (nonatomic,strong) UIPopoverController *popOverConroller;
- (IBAction)btnNext:(id)sender;

@end
