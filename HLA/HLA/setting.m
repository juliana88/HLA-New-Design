//
//  setting.m
//  HLA Ipad
//
//  Created by Md. Nazmus Saadat on 9/28/12.
//  Copyright (c) 2012 InfoConnect Sdn Bhd. All rights reserved.
//

#import "setting.h"
#import "ChangePassword.h"
#import "UserProfile.h"
#import "SecurityQuestion.h"
#import "AppDelegate.h"

@interface setting ()

@end

@implementation setting
@synthesize myTableView;
@synthesize ListOfSubMenu;
@synthesize indexNo;
@synthesize userRequest;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    ListOfSubMenu = [[NSMutableArray alloc] initWithObjects:@"User Profile", @"Change Password", nil ];
    [self.view addSubview:myTableView];
    myTableView.backgroundColor = [UIColor clearColor];
    myTableView.backgroundView = nil;
    myTableView.opaque = NO;
    
}


- (void)viewDidUnload
{
    [self setMyTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft || interfaceOrientation==UIInterfaceOrientationLandscapeRight)
        return YES;
    
    return NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;   
}

- (NSInteger)tableView:(UITableView *)myTableView numberOfRowsInSection:(NSInteger)section {
    
    return ListOfSubMenu.count;
}

- (UITableViewCell *)tableView:(UITableView *)myTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = [ListOfSubMenu objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont fontWithName:@"TreBuchet MS" size:16 ];
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   
    if (indexPath.row == 0) {
         UserProfile * UserProfileView = [self.storyboard instantiateViewControllerWithIdentifier:@"UserProfile"];
        
        UserProfileView.modalPresentationStyle = UIModalPresentationPageSheet;
        UserProfileView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        UserProfileView.indexNo = self.indexNo;
        UserProfileView.idRequest = self.userRequest;
        [self presentModalViewController:UserProfileView animated:YES];
        UserProfileView.view.superview.frame = CGRectMake(350, 50, 600, 600);
    }
    /*
     
     
     
     
    else if (indexPath.row == 1) {
        SecurityQuestion *SecurityQuesView = [self.storyboard instantiateViewControllerWithIdentifier:@"SecurityQuestion"];
        SecurityQuesView.modalPresentationStyle = UIModalPresentationFormSheet;
        SecurityQuesView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        SecurityQuesView.userID = self.indexNo;
        [self presentModalViewController:SecurityQuesView animated:YES];
        SecurityQuesView.view.superview.frame = CGRectMake(350, 50, 600, 600); 
    }
   */
    else if (indexPath.row == 1) {
        //ChangePassword* zzz = [self.storyboard instantiateViewControllerWithIdentifier:@"ChangePwd"];
        //zzz.userID = self.indexNo;
        
        ChangePassword *changePwdView = [self.storyboard instantiateViewControllerWithIdentifier:@"ChangePwd"];
        changePwdView.modalPresentationStyle = UIModalPresentationPageSheet;
        changePwdView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        changePwdView.userID = self.indexNo;
        [self presentModalViewController:changePwdView animated:YES];
        changePwdView.view.superview.frame = CGRectMake(350, 50, 600, 600); 
    }
    
    
    

}

@end
