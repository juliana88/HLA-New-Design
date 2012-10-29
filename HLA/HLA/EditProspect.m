//
//  EditProspect.m
//  HLA Ipad
//
//  Created by Md. Nazmus Saadat on 10/1/12.
//  Copyright (c) 2012 InfoConnect Sdn Bhd. All rights reserved.
//

#import "EditProspect.h"
#import "ProspectListing.h"
#import <QuartzCore/QuartzCore.h>
#import "ColorHexCode.h"

@interface EditProspect ()

@end

@implementation EditProspect
@synthesize txtPrefix1;
@synthesize txtPrefix2;
@synthesize txtPrefix3;
@synthesize txtPrefix4;
@synthesize txtPrefix5;
@synthesize outletDelete;
@synthesize outletType2;
@synthesize outletType3;
@synthesize outletType4;
@synthesize outletType5;
@synthesize txtContact2;
@synthesize txtContact3;
@synthesize txtContact4;
@synthesize txtContact5;
@synthesize ContactTypePicker;
@synthesize DobPicker;
@synthesize txtRemark;
@synthesize pickerToolbar;
@synthesize txtHomeAddr1;
@synthesize txtHomeAddr2;
@synthesize txtHomeAddr3;
@synthesize txtHomePostCode;
@synthesize txtHomeTown;
@synthesize txtHomeState;
@synthesize txtHomeCountry;
@synthesize txtOfiiceAddr1;
@synthesize txtOfficeAddr2;
@synthesize txtOfficeAddr3;
@synthesize txtOfficePostCode;
@synthesize txtOfficeTown;
@synthesize txtOfficeState;
@synthesize txtOfficeCountry;
@synthesize txtExactDuties;
@synthesize txtPreferredName;
@synthesize txtrFullName;
@synthesize segGender;
@synthesize outletDOB;
@synthesize outletType1;
@synthesize txtContact1, gender, ContactType, ContactTypeTracker;
@synthesize txtEmail, pp, DOB, SelectedStateCode,SelectedOfficeStateCode, OccupCodeSelected;
@synthesize OccupationList = _OccupationList;
@synthesize OccupationListPopover = _OccupationListPopover;
@synthesize myScrollView;
@synthesize outletOccup;
@synthesize delegate = _delegate;
@synthesize ContactTypeClass = _ContactTypeClass;
@synthesize ContactTypePopover = _ContactTypePopover;
@synthesize SIDate = _SIDate;
@synthesize SIDatePopover = _SIDatePopover;

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
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad_bg_4.jpg"]];
    
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"hladb.sqlite"]];
    txtRemark.layer.borderWidth = 3.0f;
    txtRemark.layer.borderColor = [[UIColor grayColor] CGColor];
    
    [txtHomePostCode addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingDidEnd];
    [txtOfficePostCode addTarget:self action:@selector(OfficePostcodeDidChange:) forControlEvents:UIControlEventEditingDidEnd];
    
    ColorHexCode *CustomColor = [[ColorHexCode alloc]init ];
    txtHomeTown.backgroundColor = [CustomColor colorWithHexString:@"EEEEEE"];
    txtHomeState.backgroundColor = [CustomColor colorWithHexString:@"EEEEEE"];
    txtHomeCountry.backgroundColor = [CustomColor colorWithHexString:@"EEEEEE"];
    txtOfficeTown.backgroundColor = [CustomColor colorWithHexString:@"EEEEEE"];
    txtOfficeState.backgroundColor = [CustomColor colorWithHexString:@"EEEEEE"];
    txtOfficeCountry.backgroundColor = [CustomColor colorWithHexString:@"EEEEEE"];
    
    
    ContactType = [[NSArray alloc] initWithObjects:@"Mobile", @"Home", @"Fax", @"Office", nil];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)picker;
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [ContactType count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [ContactType objectAtIndex:row];
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSString *zzz = [ContactType objectAtIndex:row];
    
        
     if (ContactTypeTracker == @"2") {
     txtContact2.enabled = true;
     [outletType2 setTitle:zzz forState:UIControlStateNormal];   
     
     }
     else if (ContactTypeTracker == @"1") {
     txtContact1.enabled = true;
     [outletType1 setTitle:zzz forState:UIControlStateNormal]; 
     
     }
     else if (ContactTypeTracker == @"3") {
     [outletType3 setTitle:zzz forState:UIControlStateNormal]; 
     
     }
     else if (ContactTypeTracker == @"4") {
     [outletType4 setTitle:zzz forState:UIControlStateNormal]; 
     }
     else if (ContactTypeTracker == @"5") {
     [outletType5 setTitle:zzz forState:UIControlStateNormal]; 
     }
     
}

- (void)viewDidUnload
{
    [self setTxtPreferredName:nil];
    [self setTxtrFullName:nil];
    [self setSegGender:nil];
    [self setOutletDOB:nil];
    [self setOutletType1:nil];
    [self setTxtContact1:nil];
    [self setTxtEmail:nil];
    [self setTxtHomeAddr1:nil];
    [self setTxtHomeAddr2:nil];
    [self setTxtHomeAddr3:nil];
    [self setTxtHomePostCode:nil];
    [self setTxtHomeTown:nil];
    [self setTxtHomeState:nil];
    [self setTxtHomeCountry:nil];
    [self setTxtOfiiceAddr1:nil];
    [self setTxtOfficeAddr2:nil];
    [self setTxtOfficeAddr3:nil];
    [self setTxtOfficePostCode:nil];
    [self setTxtOfficeTown:nil];
    [self setTxtOfficeState:nil];
    [self setTxtOfficeCountry:nil];
    [self setTxtExactDuties:nil];
    [self setTxtRemark:nil];
    [self setPickerToolbar:nil];
    [self setContactTypePicker:nil];
    [self setDobPicker:nil];
    [self setMyScrollView:nil];
    [self setOutletOccup:nil];
    [self setTxtContact1:nil];
    [self setTxtContact1:nil];
    [self setOutletDelete:nil];
    [self setOutletType2:nil];
    [self setOutletType3:nil];
    [self setOutletType4:nil];
    [self setOutletType5:nil];
    [self setTxtContact2:nil];
    [self setTxtContact3:nil];
    [self setTxtContact4:nil];
    [self setTxtContact5:nil];
    [self setTxtPrefix1:nil];
    [self setTxtPrefix2:nil];
    [self setTxtPrefix3:nil];
    [self setTxtPrefix4:nil];
    [self setTxtPrefix5:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if (interfaceOrientation==UIInterfaceOrientationLandscapeRight)
        return YES;
    
    return NO;
}


- (void)viewWillAppear:(BOOL)animated
{
    txtPreferredName.text = pp.NickName;
    txtrFullName.text = pp.ProspectName;
    txtHomeAddr1.text = pp.ResidenceAddress1;
    txtHomeCountry.text = pp.ResidenceAddressCountry;
    txtHomePostCode.text = pp.ResidenceAddressPostCode;
    txtHomeTown.text = pp.ResidenceAddressTown;
    txtOfiiceAddr1.text = pp.OfficeAddress1;
    txtOfficePostCode.text = pp.OfficeAddressPostCode;
    txtOfficeCountry.text = pp.OfficeAddressCountry;
    txtOfficeTown.text = pp.OfficeAddressTown;
    txtRemark.text = pp.ProspectRemark;
    txtEmail.text = pp.ProspectEmail;
    txtHomeAddr3.text = pp.ResidenceAddress3;
    txtHomeAddr2.text = pp.ResidenceAddress2;
    txtOfficeAddr2.text = pp.OfficeAddress2;
    txtOfficeAddr3.text = pp.OfficeAddress3;
    txtExactDuties.text = pp.ExactDuties;
    
    if ([pp.ProspectGender isEqualToString:@"M"]) {
        gender = @"M";
        segGender.selectedSegmentIndex = 0;
    }
    else { 
        gender = @"F";
        segGender.selectedSegmentIndex = 1;
    }
    
    txtContact1.text = @"";
    txtContact2.text = @"";
    txtContact3.text = @"";
    txtContact4.text = @"";
    txtContact5.text = @"";
    
    outletType1.titleLabel.text = @"";
    outletType2.titleLabel.text = @"";
    outletType3.titleLabel.text = @"";
    outletType4.titleLabel.text = @"";
    outletType5.titleLabel.text = @"";
    
    
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT ContactCode, ContactNo, Prefix FROM contact_input where indexNo = %@ ", pp.ProspectID];
        
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            int a = 0;
            while (sqlite3_step(statement) == SQLITE_ROW){
                
                NSString *ContactCode = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                NSString *ContactNo = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSString *Prefix = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];

                if (a==0) {
                    if ([ContactCode isEqualToString:@"CONT008"]) { //mobile
                        [outletType1 setTitle:@"Mobile" forState:UIControlStateNormal];
                        txtContact1.text  = ContactNo;
                        txtPrefix1.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT006"]) { //home
                        [outletType1 setTitle:@"Home" forState:UIControlStateNormal];
                        txtContact1.text = ContactNo;
                        txtPrefix1.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT009"]) { //fax
                        [outletType1 setTitle:@"Fax" forState:UIControlStateNormal];
                        txtContact1.text = ContactNo;
                        txtPrefix1.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT007"]) { //office
                        [outletType1 setTitle:@"Office" forState:UIControlStateNormal];
                        txtContact1.text = ContactNo;
                        txtPrefix1.text = Prefix;
                    }
                }
                else if (a==1) {
                    if ([ContactCode isEqualToString:@"CONT008"]) { //mobile
                        [outletType2 setTitle:@"Mobile" forState:UIControlStateNormal];
                        txtContact2.text  = ContactNo;
                        txtPrefix2.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT006"]) { //home
                        [outletType2 setTitle:@"Home" forState:UIControlStateNormal];
                        txtContact2.text = ContactNo;
                        txtPrefix2.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT009"]) { //fax
                        [outletType2 setTitle:@"Fax" forState:UIControlStateNormal];
                        txtContact2.text = ContactNo;
                        txtPrefix2.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT007"]) { //office
                        [outletType2 setTitle:@"Office" forState:UIControlStateNormal];
                        txtContact2.text = ContactNo;
                        txtPrefix2.text = Prefix;
                    }
                }
                else if (a==2) {
                    if ([ContactCode isEqualToString:@"CONT008"]) { //mobile
                        [outletType3 setTitle:@"Mobile" forState:UIControlStateNormal];
                        txtContact3.text  = ContactNo;
                        txtPrefix3.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT006"]) { //home
                        [outletType3 setTitle:@"Home" forState:UIControlStateNormal];
                        txtContact3.text = ContactNo;
                        txtPrefix3.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT009"]) { //fax
                        [outletType3 setTitle:@"Fax" forState:UIControlStateNormal];
                        txtContact3.text = ContactNo;
                        txtPrefix3.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT007"]) { //office
                        [outletType3 setTitle:@"Office" forState:UIControlStateNormal];
                        txtContact3.text = ContactNo;
                        txtPrefix3.text = Prefix;
                    }
                }
                else if (a==3) {
                    if ([ContactCode isEqualToString:@"CONT008"]) { //mobile
                        [outletType4 setTitle:@"Mobile" forState:UIControlStateNormal];
                        txtContact4.text  = ContactNo;
                        txtPrefix4.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT006"]) { //home
                        [outletType4 setTitle:@"Home" forState:UIControlStateNormal];
                        txtContact4.text = ContactNo;
                        txtPrefix4.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT009"]) { //fax
                        [outletType4 setTitle:@"Fax" forState:UIControlStateNormal];
                        txtContact4.text = ContactNo;
                        txtPrefix4.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT007"]) { //office
                        [outletType4 setTitle:@"Office" forState:UIControlStateNormal];
                        txtContact4.text = ContactNo;
                        txtPrefix4.text = Prefix;
                    }
                }
                else if (a==4) {
                    if ([ContactCode isEqualToString:@"CONT008"]) { //mobile
                        [outletType5 setTitle:@"Mobile" forState:UIControlStateNormal];
                        txtContact5.text  = ContactNo;
                        txtPrefix5.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT006"]) { //home
                        [outletType5 setTitle:@"Home" forState:UIControlStateNormal];
                        txtContact5.text = ContactNo;
                        txtPrefix5.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT009"]) { //fax
                        [outletType5 setTitle:@"Fax" forState:UIControlStateNormal];
                        txtContact5.text = ContactNo;
                        txtPrefix5.text = Prefix;
                    }
                    else if ([ContactCode isEqualToString:@"CONT007"]) { //office
                        [outletType5 setTitle:@"Office" forState:UIControlStateNormal];
                        txtContact5.text = ContactNo;
                        txtPrefix5.text = Prefix;
                    }
                }
                a = a + 1;
            }
            sqlite3_finalize(statement);
            [self PopulateOccupCode];
            [self PopulateState];
            [self PopulateOfficeState];
            
        }
        sqlite3_close(contactDB);
        
    }
    else {
        NSLog(@"Error opening database");
    }
    
    
    [self.outletDOB setTitle:pp.ProspectDOB forState:UIControlStateNormal];
    
    [super viewWillAppear:animated];
}

-(void) PopulateOccupCode{
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT OccpDesc FROM Adm_Occp where status = 1 and OccpCode = \"%@\"", pp.ProspectOccupationCode];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW){
                NSString *OccpDesc = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                //txtOccup.text = OccpDesc;
                OccupCodeSelected = pp.ProspectOccupationCode;
                [outletOccup setTitle:OccpDesc forState:UIControlStateNormal];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);   
    }
}

-(void) PopulateState{
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT StateDesc FROM eProposal_state where status = \"A\" and StateCode = \"%@\"", pp.ResidenceAddressState];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW){
                NSString *StateName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                txtHomeState.text = StateName;
                SelectedStateCode = pp.ResidenceAddressState;
            }
            sqlite3_finalize(statement);
            
        }
        sqlite3_close(contactDB);   
    }
}


-(void) PopulateOfficeState{
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT StateDesc FROM eProposal_state where status = \"A\" and StateCode = \"%@\"", pp.OfficeAddressState];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW){
                NSString *StateName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                txtOfficeState.text = StateName;
                SelectedOfficeStateCode = pp.OfficeAddressState;
                
            }
            sqlite3_finalize(statement);
            
        }
        sqlite3_close(contactDB);
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (IBAction)btnDOB:(id)sender {
    /*
    DobPicker.hidden = NO;
    pickerToolbar.hidden = NO;
    [self.view endEditing:TRUE];
    txtRemark.hidden = TRUE;
    ContactTypePicker.hidden = true;
    outletDelete.hidden = true;
     */
    
    [self resignFirstResponder];
    [self.view endEditing:YES];
    
    Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
    id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
    [activeInstance performSelector:@selector(dismissKeyboard)];
    
    
    if (_SIDate == Nil) {
        
        self.SIDate = [self.storyboard instantiateViewControllerWithIdentifier:@"SIDate"];
        _SIDate.delegate = self;
        self.SIDatePopover = [[UIPopoverController alloc] initWithContentViewController:_SIDate];
    }
    
    [self.SIDatePopover presentPopoverFromRect:[sender frame ]  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

- (IBAction)btnContactType1:(id)sender {
    
    [self resignFirstResponder];
    [self.view endEditing:TRUE];
    
    Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
    id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
    [activeInstance performSelector:@selector(dismissKeyboard)];
    
    txtContact1.enabled = true;
    ContactTypeTracker = @"1";
    if (_ContactTypeClass == nil) {
        self.ContactTypeClass = [[ContactTypeClass alloc] initWithStyle:UITableViewStylePlain];
        _ContactTypeClass.ContactTypeDelegate = self;
        self.ContactTypePopover = [[UIPopoverController alloc] initWithContentViewController:_ContactTypeClass];               
    }
    [self.ContactTypePopover setPopoverContentSize:CGSizeMake(300.0f, 255.0f)];
    
    [self.ContactTypePopover presentPopoverFromRect:[sender frame]  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}
- (IBAction)btnOccup:(id)sender {
    if (_OccupationList == nil) {
        self.OccupationList = [[OccupationList alloc] initWithStyle:UITableViewStylePlain];
        _OccupationList.delegate = self;
        self.OccupationListPopover = [[UIPopoverController alloc] initWithContentViewController:_OccupationList];               
    }
    
    [self.OccupationListPopover presentPopoverFromRect:[sender frame]  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}
- (IBAction)btnDone:(id)sender {
    if (DobPicker.hidden == FALSE) { //DOB picker
        pickerToolbar.hidden = YES;
        DobPicker.hidden = YES;
        txtRemark.hidden = FALSE;
        outletDelete.hidden = false;
    }
    else { // Contact type picker
        pickerToolbar.hidden = true;
        ContactTypePicker.hidden = true;
        txtRemark.hidden = FALSE;
        outletDelete.hidden = false;
    }

}
- (IBAction)ActionGender:(id)sender {
    if ([segGender selectedSegmentIndex]==0) {
        gender = @"M";
    } 
    else {
        gender = @"F";
    }    
}

- (IBAction)btnDelete:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle: NSLocalizedString(@"Delete prospect",nil)
                          message: NSLocalizedString(@"Are you sure you want to delete this prospect profile?",nil)
                          delegate: self
                          cancelButtonTitle: NSLocalizedString(@"No",nil)
                          otherButtonTitles: NSLocalizedString(@"Yes",nil), nil];
    alert.tag = 1;
    [alert show];
}

- (IBAction)ActionDobPicker:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    NSString *pickerDate = [dateFormatter stringFromDate:[DobPicker date]];
    
    NSString *msg = [NSString stringWithFormat:@"%@",pickerDate];
    [self.outletDOB setTitle:msg forState:UIControlStateNormal];
}

- (bool) Validation{
    
    if([[txtPreferredName.text stringByReplacingOccurrencesOfString:@" " withString:@"" ] isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Preferred Name is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    else {
        BOOL valid;
        NSString *strToBeTest = [txtPreferredName.text stringByReplacingOccurrencesOfString:@" " withString:@"" ] ;
        
        for (int i=0; i<strToBeTest.length; i++) {
            int str1=(int)[strToBeTest characterAtIndex:i];
            
            if((str1 >96 && str1 <123)  || (str1 >64 && str1 <91) || str1 == 39 || str1 == 64 || str1 == 47 || str1 == 45 || str1 == 46){
                valid = TRUE;
                
            }else {
                valid = FALSE;
                break;
            }
        }
        if (!valid) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Invalid input format. Input must be alphabet A to Z, space, apostrotrophe ('), alias(@),slash(/),dash(-) or dot(.)." 
                                                           delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return false;
        }
    }
    
    if([[txtrFullName.text stringByReplacingOccurrencesOfString:@" " withString:@"" ] isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Full Name is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    else {
        BOOL valid;
        NSString *strToBeTest = [txtrFullName.text stringByReplacingOccurrencesOfString:@" " withString:@"" ] ;
        
        for (int i=0; i<strToBeTest.length; i++) {
            int str1=(int)[strToBeTest characterAtIndex:i];
            
            if((str1 >96 && str1 <123)  || (str1 >64 && str1 <91) || str1 == 39 || str1 == 64 || str1 == 47 || str1 == 45 || str1 == 46){
                valid = TRUE;
                
            }else {
                valid = FALSE;
                break;
            }
        }
        if (!valid) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Invalid input format. Input must be alphabet A to Z, space, apostrotrophe ('), alias(@),slash(/),dash(-) or dot(.)" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return false;
        }
    }
    
    if(segGender.selectedSegmentIndex == -1){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Gender field is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    
    if(outletDOB.titleLabel.text == NULL){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Date of Birth is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    
    
    if(outletType1.titleLabel.text != NULL) {
        if ([txtPrefix1.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Prefix for contact no 1 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return false;
        }
        else {
            if (txtPrefix1.text.length > 4) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Prefix length cannot be more than 4 characters" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [self resignFirstResponder];
                [self.view endEditing:TRUE];
                
                [alert show];
                return false;
            }
            else {
                if(![txtContact1.text isEqualToString:@"" ]){
                    
                    if (txtContact1.text.length > 8) {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Contact number length must be less than 8 characters long" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                    
                    BOOL valid; 
                    BOOL valid2;
                    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
                    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:txtContact1.text];
                    NSCharacterSet *inStringSet2 = [NSCharacterSet characterSetWithCharactersInString:txtPrefix1.text];
                    
                    valid = [alphaNums isSupersetOfSet:inStringSet]; 
                    valid2 = [alphaNums isSupersetOfSet:inStringSet2];
                    if (!valid) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Contact number must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                    
                    if (!valid2) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Prefix for contact no 1 must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                }
                else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                    message:@"Contact No for contact no 1 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [self resignFirstResponder];
                    [self.view endEditing:TRUE];
                    
                    [alert show];
                    return FALSE;
                }
            }
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Contact No 1 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return FALSE; 
    }
    
    if(![outletType2.titleLabel.text isEqualToString:@""]) {
        if ([txtPrefix2.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Prefix for contact no 2 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return false;
        }
        else {
            if (txtPrefix2.text.length > 4) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Prefix length cannot be more than 4 characters" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [self resignFirstResponder];
                [self.view endEditing:TRUE];
                
                [alert show];
                return false;
            }
            else {
                if(![txtContact2.text isEqualToString:@"" ]){
                    
                    if (txtContact2.text.length > 8) {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Contact number length must be less than 8 characters long" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                    
                    BOOL valid; 
                    BOOL valid2;
                    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
                    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:txtContact2.text];
                    NSCharacterSet *inStringSet2 = [NSCharacterSet characterSetWithCharactersInString:txtPrefix2.text];
                    
                    valid = [alphaNums isSupersetOfSet:inStringSet]; 
                    valid2 = [alphaNums isSupersetOfSet:inStringSet2];
                    if (!valid) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Contact number must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                    
                    if (!valid2) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Prefix for contact no 2 must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                }
                else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                    message:@"Contact No for contact no 2 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [self resignFirstResponder];
                    [self.view endEditing:TRUE];
                    
                    [alert show];
                    return FALSE;
                }
            }
        }
    }
    
    if(![outletType3.titleLabel.text isEqualToString:@""]) {
        if ([txtPrefix3.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Prefix for contact no 3 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return false;
        }
        else {
            if (txtPrefix3.text.length > 4) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Prefix length cannot be more than 4 characters" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [self resignFirstResponder];
                [self.view endEditing:TRUE];
                
                [alert show];
                return false;
            }
            else {
                if(![txtContact3.text isEqualToString:@"" ]){
                    BOOL valid; 
                    BOOL valid2;
                    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
                    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:txtContact3.text];
                    NSCharacterSet *inStringSet2 = [NSCharacterSet characterSetWithCharactersInString:txtPrefix3.text];
                    
                    valid = [alphaNums isSupersetOfSet:inStringSet]; 
                    valid2 = [alphaNums isSupersetOfSet:inStringSet2];
                    if (!valid) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Contact number must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                    
                    if (!valid2) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Prefix for contact no 3 must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                }
                else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                    message:@"Contact No for contact no 3 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [self resignFirstResponder];
                    [self.view endEditing:TRUE];
                    
                    [alert show];
                    return FALSE;
                }
            }
        }
    }
    
    if(![outletType4.titleLabel.text isEqualToString:@""]) {
        if ([txtPrefix4.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Prefix for contact no 4 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return false;
        }
        else {
            if (txtPrefix4.text.length > 4) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Prefix length cannot be more than 4 characters" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [self resignFirstResponder];
                [self.view endEditing:TRUE];
                
                [alert show];
                return false;
            }
            else {
                if(![txtContact4.text isEqualToString:@"" ]){
                   
                    if (txtContact4.text.length > 8) {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Contact number length must be less than 8 characters long" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                    
                    BOOL valid; 
                    BOOL valid2;
                    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
                    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:txtContact4.text];
                    NSCharacterSet *inStringSet2 = [NSCharacterSet characterSetWithCharactersInString:txtPrefix4.text];
                    
                    valid = [alphaNums isSupersetOfSet:inStringSet]; 
                    valid2 = [alphaNums isSupersetOfSet:inStringSet2];
                    if (!valid) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Contact number must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                    
                    if (!valid2) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Prefix for contact no 4 must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                }
                else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                    message:@"Contact No for contact no 4 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [self resignFirstResponder];
                    [self.view endEditing:TRUE];
                    
                    [alert show];
                    return FALSE;
                }
            }
        }
    }
    
    if(![outletType5.titleLabel.text isEqualToString:@""]) {
        if ([txtPrefix5.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Prefix for contact no 5 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return false;
        }
        else {
            if (txtPrefix5.text.length > 4) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Prefix length cannot be more than 4 characters" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [self resignFirstResponder];
                [self.view endEditing:TRUE];
                
                [alert show];
                return false;
            }
            else {
                if(![txtContact5.text isEqualToString:@"" ]){
                    
                    if (txtContact5.text.length > 8) {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Contact number length must be less than 8 characters long" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                    
                    BOOL valid; 
                    BOOL valid2;
                    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
                    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:txtContact5.text];
                    NSCharacterSet *inStringSet2 = [NSCharacterSet characterSetWithCharactersInString:txtPrefix5.text];
                    
                    valid = [alphaNums isSupersetOfSet:inStringSet]; 
                    valid2 = [alphaNums isSupersetOfSet:inStringSet2];
                    if (!valid) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Contact number must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                    
                    if (!valid2) {
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                        message:@"Prefix for contact no 5 must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        
                        [self resignFirstResponder];
                        [self.view endEditing:TRUE];
                        
                        [alert show];
                        return false;
                    }
                }
                else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                    message:@"Contact No for contact no 5 is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [self resignFirstResponder];
                    [self.view endEditing:TRUE];
                    
                    [alert show];
                    return FALSE;
                }
            }
        }
    }
    
    
    if([[txtEmail.text stringByReplacingOccurrencesOfString:@" " withString:@"" ] isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Email address is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    
    if([[txtHomeAddr1.text stringByReplacingOccurrencesOfString:@" " withString:@"" ] isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Home Address is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    
    if([txtHomePostCode.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Home Address PostCode is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    else {
        BOOL valid;
        NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:txtHomePostCode.text];
        valid = [alphaNums isSupersetOfSet:inStringSet]; 
        if (!valid) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Residence post code must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return false;
        }
    }
    
    if([[txtOfiiceAddr1.text stringByReplacingOccurrencesOfString:@" " withString:@"" ] isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Office Address is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    
    if([txtOfficePostCode.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Office Address PostCode is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    else {
        BOOL valid;
        NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:txtOfficePostCode.text];
        valid = [alphaNums isSupersetOfSet:inStringSet]; 
        if (!valid) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Office post code must be in numeric form" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return false;
        }
    }
    
    if(OccupCodeSelected == NULL){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Occupation is required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self resignFirstResponder];
        [self.view endEditing:TRUE];
        
        [alert show];
        return false;
    }
    
    if(![txtEmail.text isEqualToString:@""]){
        if( [self NSStringIsValidEmail:txtEmail.text] == FALSE){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"You have entered an invalid email." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self resignFirstResponder];
            [self.view endEditing:TRUE];
            
            [alert show];
            return FALSE;
        }
    }
    
    return true;
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; 
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(void) GetLastID{
    
    sqlite3_stmt *statement3;
    NSString *lastID;
    NSString *contactCode;
    
    //delete record first 
    [self DeleteRecord];
    
    
    
    for (int a=0; a<5; a++) {
        
        switch (a) {
            case 0:
                if (outletType1.titleLabel.text == @"Mobile") {
                    contactCode = @"CONT008";    
                }
                else if (outletType1.titleLabel.text == @"Home") {
                    contactCode = @"CONT006";
                }
                else if (outletType1.titleLabel.text == @"Fax") {
                    contactCode = @"CONT009";
                }
                else if (outletType1.titleLabel.text == @"Office") {
                    contactCode = @"CONT007";
                }
                else {
                    contactCode = @"";
                }
                
                break;

            case 1:
                if (outletType2.titleLabel.text == @"Mobile") {
                    contactCode = @"CONT008";    
                }
                else if (outletType2.titleLabel.text == @"Home") {
                    contactCode = @"CONT006";
                }
                else if (outletType2.titleLabel.text == @"Fax") {
                    contactCode = @"CONT009";
                }
                else if (outletType2.titleLabel.text == @"Office") {
                    contactCode = @"CONT007";
                }
                else {
                    contactCode = @"";
                }
                

                break;
            case 2:
                if (outletType3.titleLabel.text == @"Mobile") {
                    contactCode = @"CONT008";    
                }
                else if (outletType3.titleLabel.text == @"Home") {
                    contactCode = @"CONT006";
                }
                else if (outletType3.titleLabel.text == @"Fax") {
                    contactCode = @"CONT009";
                }
                else if (outletType3.titleLabel.text == @"Office") {
                    contactCode = @"CONT007";
                }
                else {
                    contactCode = @"";
                }
                

                break;
            case 3:
                if (outletType4.titleLabel.text == @"Mobile") {
                    contactCode = @"CONT008";    
                }
                else if (outletType4.titleLabel.text == @"Home") {
                    contactCode = @"CONT006";
                }
                else if (outletType4.titleLabel.text == @"Fax") {
                    contactCode = @"CONT009";
                }
                else if (outletType4.titleLabel.text == @"Office") {
                    contactCode = @"CONT007";
                }
                else {
                    contactCode = @"";
                }
                

                break;
            case 4:
                if (outletType5.titleLabel.text == @"Mobile") {
                    contactCode = @"CONT008";    
                }
                else if (outletType5.titleLabel.text == @"Home") {
                    contactCode = @"CONT006";
                }
                else if (outletType5.titleLabel.text == @"Fax") {
                    contactCode = @"CONT009";
                }
                else if (outletType5.titleLabel.text == @"Office") {
                    contactCode = @"CONT007";
                }
                else {
                    contactCode = @"";
                }
    
                break;
            
        }
        
        
        if (![contactCode isEqualToString:@""]) {
        
            lastID = pp.ProspectID;
            NSString *insertContactSQL;
            
            if (a == 0) {
                insertContactSQL = [NSString stringWithFormat:
                                              @"INSERT INTO contact_input(\"IndexNo\",\"contactCode\", \"ContactNo\", \"Primary\", \"Prefix\") "
                                              " VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", lastID, contactCode, txtContact1.text, @"N", txtPrefix1.text];
                
            }
            else if (a == 1) {
                insertContactSQL = [NSString stringWithFormat:
                                    @"INSERT INTO contact_input(\"IndexNo\",\"contactCode\", \"ContactNo\", \"Primary\", \"Prefix\") "
                                    " VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", lastID, contactCode, txtContact2.text, @"N", txtPrefix2.text];
                
            }
            else if (a == 2) {
                insertContactSQL = [NSString stringWithFormat:
                                    @"INSERT INTO contact_input(\"IndexNo\",\"contactCode\", \"ContactNo\", \"Primary\", \"Prefix\") "
                                    " VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", lastID, contactCode, txtContact3.text, @"N", txtPrefix3.text];
                
            }
            else if (a == 3) {
                insertContactSQL = [NSString stringWithFormat:
                                    @"INSERT INTO contact_input(\"IndexNo\",\"contactCode\", \"ContactNo\", \"Primary\", \"Prefix\") "
                                    " VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", lastID, contactCode, txtContact4.text, @"N", txtPrefix4.text];
                
            }
            else if (a == 4) {
                insertContactSQL = [NSString stringWithFormat:
                                    @"INSERT INTO contact_input(\"IndexNo\",\"contactCode\", \"ContactNo\", \"Primary\", \"Prefix\") "
                                    " VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", lastID, contactCode, txtContact5.text, @"N", txtPrefix5.text];
                
            }
            
            if (sqlite3_open([databasePath UTF8String ], &contactDB) == SQLITE_OK) {
                
                const char *insert_contactStmt = [insertContactSQL UTF8String];
                if(sqlite3_prepare_v2(contactDB, insert_contactStmt, -1, &statement3, NULL) == SQLITE_OK) {
                    if (sqlite3_step(statement3) == SQLITE_DONE){
                        sqlite3_finalize(statement3);
                        //UIAlertView *SuccessAlert = [[UIAlertView alloc] initWithTitle:@"Prospect Profile" message:@"Saved Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                        //[SuccessAlert show];
                        
                    }
                    else {
                        NSLog(@"Error - 4");
                    }
                }
                else {
                    NSLog(@"Error - 3");
                    
                }
                
                sqlite3_close(contactDB);
            }
        }
    }
    
    if (_delegate != nil) {
        [_delegate FinishEdit];
    }
    
    UIAlertView *SuccessAlert = [[UIAlertView alloc] initWithTitle:@"Edit Prospect Profile" 
                                    message:@"Prospect record successfully updated." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    SuccessAlert.tag = 2;
    [SuccessAlert show];
    
    /*
    ProspectListing *ListingPage = [self.storyboard instantiateViewControllerWithIdentifier:@"Listing"];
    [ListingPage ReloadTableData];
    [ListingPage.tableView reloadData];
    */
}


- (void) DeleteRecord{
    sqlite3_stmt *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
    {
        NSString *DeleteSQL = [NSString stringWithFormat:@"Delete from contact_input where indexNo = \"%@\"", pp.ProspectID];
        const char *Delete_stmt = [DeleteSQL UTF8String];
        if(sqlite3_prepare_v2(contactDB, Delete_stmt, -1, &statement, NULL) == SQLITE_OK) 
        {
            sqlite3_step(statement);
            sqlite3_finalize(statement);
            
        }
        else {
            
            NSLog(@"Error in Delete Statement");
        }
        sqlite3_close(contactDB);
    }
}

- (void)OccupCodeSelected:(NSString *)OccupCode{
    OccupCodeSelected = OccupCode;
}

- (void)OccupDescSelected:(NSString *)color {
    [outletOccup setTitle:color forState:UIControlStateNormal];
    [self resignFirstResponder];
    [self.view endEditing:TRUE];
    
    [self.OccupationListPopover dismissPopoverAnimated:YES];
    
}

-(void)keyboardDidShow:(NSNotificationCenter *)notification
{
    self.myScrollView.frame = CGRectMake(0, 20, 1000, 748-350);
    self.myScrollView.contentSize = CGSizeMake(1000, 748);
    
    CGRect textFieldRect = [activeField frame];
    textFieldRect.origin.y += 15;
    [self.myScrollView scrollRectToVisible:textFieldRect animated:YES];
    pickerToolbar.hidden = true;
    DobPicker.hidden = TRUE;
    txtRemark.hidden = FALSE;
}

-(void)keyboardDidHide:(NSNotificationCenter *)notification
{
    self.myScrollView.frame = CGRectMake(0, 20, 1000, 748);
    ContactTypePicker.hidden = true;
}

- (IBAction)btnCancel:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
    
    
    [self.view endEditing:YES];
    [self resignFirstResponder];
    
    Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
    id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
    [activeInstance performSelector:@selector(dismissKeyboard)];
    
    
    UIAlertView *Alert = [[UIAlertView alloc] initWithTitle:@"Prospect Profile" message:@"Are you sure you want to discard all the changes ?" 
                                                   delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", Nil];
    Alert.tag = 1003;
    [Alert show];
     

    
}

- (IBAction)btnSave:(id)sender {
    [self.view endEditing:YES];
    [self resignFirstResponder];
    
    Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
    id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
    [activeInstance performSelector:@selector(dismissKeyboard)];
    
    
    if ([self Validation] == TRUE) {
        
        sqlite3_stmt *statement;
        
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            NSString *insertSQL = [NSString stringWithFormat:
                                   @"update prospect_profile set \"PreferredName\" = \"%@\" ,\"ProspectName\" = \"%@\", \"ProspectDOB\" = \"%@\", "
                                   "\"ProspectGender\" = \"%@\", \"ResidenceAddress1\" = \"%@\", \"ResidenceAddress2\" = \"%@\", \"ResidenceAddress3\" = \"%@\", "
                                   "\"ResidenceAddressTown\" = \"%@\",\"ResidenceAddressState\" = \"%@\",\"ResidenceAddressPostCode\" = \"%@\", "
                                   "\"ResidenceAddressCountry\"= \"%@\", \"OfficeAddress1\"= \"%@\", \"OfficeAddress2\"= \"%@\", \"OfficeAddress3\"= \"%@\", "
                                   "\"OfficeAddressTown\"= \"%@\",\"OfficeAddressState\"= \"%@\",\"OfficeAddressPostCode\"= \"%@\", "
                                   "\"OfficeAddressCountry\"= \"%@\", \"ProspectEmail\"= \"%@\",\"ProspectOccupationCode\"= \"%@\", \"ExactDuties\"= \"%@\", \"ProspectRemark\"= \"%@\","
                                   "\"DateModified\"= %@,\"ModifiedBy\"= \"%@\" where indexNo = \"%@\" "
                                   "", txtPreferredName.text, txtrFullName.text, outletDOB.titleLabel.text, gender, txtHomeAddr1.text, txtHomeAddr2.text, 
                                   txtHomeAddr3.text, txtHomeTown.text, SelectedStateCode, txtHomePostCode.text, txtHomeCountry.text, txtOfiiceAddr1.text, 
                                   txtOfficeAddr2.text, txtOfficeAddr3.text, txtOfficeTown.text, SelectedOfficeStateCode, txtOfficePostCode.text, 
                                   txtOfficeCountry.text, txtEmail.text, OccupCodeSelected, txtExactDuties.text, txtRemark.text, @"datetime(\"now\", \"+8 hour\")", @"1", pp.ProspectID];
            
            
            const char *Update_stmt = [insertSQL UTF8String];
            if(sqlite3_prepare_v2(contactDB, Update_stmt, -1, &statement, NULL) == SQLITE_OK) {
                if (sqlite3_step(statement) == SQLITE_DONE)
                {
                    [self GetLastID];
                    
                } else {
                    
                    UIAlertView *failAlert = [[UIAlertView alloc] initWithTitle:@"Prospect Profile" message:@"Fail in update" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    [failAlert show];
                }
                sqlite3_finalize(statement);
            }
            else {
                NSLog(@"Error Statement");
            }
            sqlite3_close(contactDB);
        }
        else {
            NSLog(@"Error Open");
        }
        
        
    }
    /*
    ProspectListing *ListingPage = [self.storyboard instantiateViewControllerWithIdentifier:@"Listing"];
    [ListingPage ReloadTableData];
    [ListingPage.tableView reloadData];
    */
    
}

-(void)textFieldDidChange:(id) sender
{

    BOOL gotRow = false;
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT \"Town\", \"Statedesc\", b.Statecode FROM adm_postcode as A, eproposal_state as B where trim(a.Statecode) = b.statecode and Postcode = %@ ", txtHomePostCode.text];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while (sqlite3_step(statement) == SQLITE_ROW){
                NSString *Town = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                NSString *State = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSString *Statecode = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)]; 
                
                txtHomeState.text = State;
                txtHomeTown.text = Town;
                txtHomeCountry.text = @"MALAYSIA";
                SelectedStateCode = Statecode;
                gotRow = true;
            }
            
        }
        
        if (gotRow == false) {
            UIAlertView *NoPostcode = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No postcode found for Residence address" 
                                                                delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            txtHomePostCode.text = @"";
            txtHomeState.text = @"";
            txtHomeTown.text = @"";
            txtHomeCountry.text = @"";
            SelectedStateCode = @"";
            [NoPostcode show];   
        }
    }
    
}

-(void)OfficePostcodeDidChange:(id) sender
{
    
    BOOL gotRow = false;
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT \"Town\", \"Statedesc\", b.Statecode FROM adm_postcode as A, eproposal_state as B where trim(a.Statecode) = b.statecode and Postcode = %@ ", txtOfficePostCode.text];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW){
                NSString *OfficeTown = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                NSString *OfficeState = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSString *Statecode = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                
                txtOfficeState.text = OfficeState;
                txtOfficeTown.text = OfficeTown;
                txtOfficeCountry.text = @"MALAYSIA";
                SelectedOfficeStateCode = Statecode;
                gotRow = true;
            }
            
            if (gotRow == false) {
                UIAlertView *NoPostcode = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No postcode found for office"
                                                                    delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                txtOfficePostCode.text = @"";
                txtOfficeState.text = @"";
                txtOfficeTown.text = @"";
                txtOfficeCountry.text = @"";
                SelectedOfficeStateCode = @"";
                [NoPostcode show];   
            }
        }
        
        
    } 
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    sqlite3_stmt *statement;
    sqlite3_stmt *statement2;
    
    switch (buttonIndex) {
        case 0: 
        {       
            if (alertView.tag == 2) {
                [self resignFirstResponder];
                [self.view endEditing:YES];
                [self dismissModalViewControllerAnimated:YES];
            }
            else if (alertView.tag == 1003) {
                [self resignFirstResponder];
                [self.view endEditing:YES];
                [self dismissModalViewControllerAnimated:YES];
            }
        }
            break;
            
        case 1: 
        {
            
            if (alertView.tag == 1) {
                
                const char *dbpath = [databasePath UTF8String];
                
                if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
                    NSString *DeleteProspectSQL = [NSString stringWithFormat:
                                                   @"Delete from prospect_profile where \"indexNo\" = \"%@\" ", pp.ProspectID];
                    
                    const char *Delete_prospectStmt = [DeleteProspectSQL UTF8String];
                    if(sqlite3_prepare_v2(contactDB, Delete_prospectStmt, -1, &statement, NULL) == SQLITE_OK)
                    {
                        int zzz = sqlite3_step(statement);
                        
                        if (zzz == SQLITE_DONE){
                            
                            /*
                             UIAlertView *SuccessAlert = [[UIAlertView alloc] initWithTitle:@"Prospect Profile" message:@"Delete Success" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                             [SuccessAlert show];    
                             
                             EditTableViewController *Listing = [self.storyboard instantiateViewControllerWithIdentifier:@"Listing"];
                             Listing.modalPresentationStyle = UIModalPresentationFullScreen;
                             Listing.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                             [self presentModalViewController:Listing animated:YES];
                             */
                        }
                        
                        sqlite3_finalize(statement);
                    }
                    
                    NSString *DeleteContactSQL = [NSString stringWithFormat:
                                                  @"Delete from contact_input where \"indexNo\" = %@ ", pp.ProspectID];
                    
                    const char *Delete_ContactStmt = [DeleteContactSQL UTF8String];
                    if(sqlite3_prepare_v2(contactDB, Delete_ContactStmt, -1, &statement2, NULL) == SQLITE_OK)
                    {
                        int delCount = sqlite3_step(statement2);
                        
                        if (delCount == SQLITE_DONE){
                            
                            sqlite3_finalize(statement);
                            
                            if (_delegate != nil) {
                                [_delegate FinishEdit];
                            }
                            
                            UIAlertView *SuccessAlert = [[UIAlertView alloc] initWithTitle:@"Prospect Profile"
                                                            message:@"Delete Success" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                            SuccessAlert.tag = 2;
                            [SuccessAlert show];    
                            
                        }
                        
                    }
                    
                sqlite3_close(contactDB);    
                }

            }
                       
        }
            break;
    }
} 

- (IBAction)btnContact2:(id)sender {
    [self resignFirstResponder];
    [self.view endEditing:TRUE];
    
    Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
    id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
    [activeInstance performSelector:@selector(dismissKeyboard)];
    
    
    txtContact2.enabled = true;
    ContactTypeTracker = @"2";
    if (_ContactTypeClass == nil) {
        self.ContactTypeClass = [[ContactTypeClass alloc] initWithStyle:UITableViewStylePlain];
        _ContactTypeClass.ContactTypeDelegate = self;
        self.ContactTypePopover = [[UIPopoverController alloc] initWithContentViewController:_ContactTypeClass];               
    }
    [self.ContactTypePopover setPopoverContentSize:CGSizeMake(300.0f, 255.0f)];
    
    [self.ContactTypePopover presentPopoverFromRect:[sender frame]  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

- (IBAction)btnContact3:(id)sender {
    [self resignFirstResponder];
    [self.view endEditing:TRUE];
    
    Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
    id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
    [activeInstance performSelector:@selector(dismissKeyboard)];
    
    
    txtContact3.enabled = true;
    ContactTypeTracker = @"3";
    if (_ContactTypeClass == nil) {
        self.ContactTypeClass = [[ContactTypeClass alloc] initWithStyle:UITableViewStylePlain];
        _ContactTypeClass.ContactTypeDelegate = self;
        self.ContactTypePopover = [[UIPopoverController alloc] initWithContentViewController:_ContactTypeClass];               
    }
    [self.ContactTypePopover setPopoverContentSize:CGSizeMake(300.0f, 255.0f)];
    
    [self.ContactTypePopover presentPopoverFromRect:[sender frame]  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

- (IBAction)btnContact4:(id)sender {
    [self resignFirstResponder];
    [self.view endEditing:TRUE];
    
    Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
    id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
    [activeInstance performSelector:@selector(dismissKeyboard)];
    
    txtContact4.enabled = true;
    ContactTypeTracker = @"4";
    if (_ContactTypeClass == nil) {
        self.ContactTypeClass = [[ContactTypeClass alloc] initWithStyle:UITableViewStylePlain];
        _ContactTypeClass.ContactTypeDelegate = self;
        self.ContactTypePopover = [[UIPopoverController alloc] initWithContentViewController:_ContactTypeClass];               
    }
    [self.ContactTypePopover setPopoverContentSize:CGSizeMake(300.0f, 255.0f)];
    
    [self.ContactTypePopover presentPopoverFromRect:[sender frame]  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

- (IBAction)btnContact5:(id)sender {
    
    [self resignFirstResponder];
    [self.view endEditing:TRUE];
    
    Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
    id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
    [activeInstance performSelector:@selector(dismissKeyboard)];
    
    txtContact5.enabled = true;
    ContactTypeTracker = @"5";
    if (_ContactTypeClass == nil) {
        self.ContactTypeClass = [[ContactTypeClass alloc] initWithStyle:UITableViewStylePlain];
        _ContactTypeClass.ContactTypeDelegate = self;
        self.ContactTypePopover = [[UIPopoverController alloc] initWithContentViewController:_ContactTypeClass];               
    }
    [self.ContactTypePopover setPopoverContentSize:CGSizeMake(300.0f, 255.0f)];
    
    [self.ContactTypePopover presentPopoverFromRect:[sender frame]  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)ContactTypeSelected:(NSString *)ContactTypeString{
    if ([ContactTypeTracker isEqualToString:@"1" ]) {
        [outletType1 setTitle:ContactTypeString forState:UIControlStateNormal ];
        [self.ContactTypePopover dismissPopoverAnimated:YES];
    }
    else if ([ContactTypeTracker isEqualToString:@"2" ]) {
        [outletType2 setTitle:ContactTypeString forState:UIControlStateNormal ];
        [self.ContactTypePopover dismissPopoverAnimated:YES];
    }
    else if ([ContactTypeTracker isEqualToString:@"3" ]) {
        [outletType3 setTitle:ContactTypeString forState:UIControlStateNormal ];
        [self.ContactTypePopover dismissPopoverAnimated:YES];
    }
    else if ([ContactTypeTracker isEqualToString:@"4" ]) {
        [outletType4 setTitle:ContactTypeString forState:UIControlStateNormal ];
        [self.ContactTypePopover dismissPopoverAnimated:YES];
    }
    else if ([ContactTypeTracker isEqualToString:@"5" ]) {
        [outletType5 setTitle:ContactTypeString forState:UIControlStateNormal ];
        [self.ContactTypePopover dismissPopoverAnimated:YES];
    }
}

-(void)DateSelected:(NSString *)strDate :(NSString *)dbDate{
    [outletDOB setTitle:strDate forState:UIControlStateNormal ];
}

-(void)CloseWindow{
    [self resignFirstResponder];
    [self.view endEditing:YES];
    [_SIDatePopover dismissPopoverAnimated:YES];
}

- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}
@end
