//
//  ReportViewController.h
//  HLA Ipad
//
//  Created by Md. Nazmus Saadat on 10/18/12.
//  Copyright (c) 2012 InfoConnect Sdn Bhd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@class DataTable,DBController;
@interface ReportViewController : UIViewController
{
    NSString *databasePath;
    sqlite3 *contactDB;
}
@property (nonatomic,strong) id SINo;
@property (nonatomic,strong) id YearlyIncome;
@property (nonatomic,strong) id CashDividend;
@property (nonatomic,strong) id CustCode;
@property (nonatomic,strong) id Name;
@property (nonatomic,strong) id strBasicAnnually;
//@property (nonatomic,strong) id strIncomeRiderAnnually;
@property (retain, nonatomic) NSMutableArray *aStrIncomeRiderAnnually;
@property (retain, nonatomic) NSMutableArray *aStrOtherRiderAnnually;
@property (nonatomic, assign) int Age;
@property (nonatomic, assign) int PolicyTerm;
@property (nonatomic, assign) int BasicSA;
@property (nonatomic, assign) int PremiumPaymentOption;
@property (nonatomic, assign) int AdvanceYearlyIncome;
@property (nonatomic, assign) int HealthLoading;
@property (retain, nonatomic) NSMutableArray *IncomeRiderCode;
@property (retain, nonatomic) NSMutableArray *IncomeRiderTerm;
@property (retain, nonatomic) NSMutableArray *IncomeRiderDesc;
@property (retain, nonatomic) NSMutableArray *IncomeRiderSA;
@property (retain, nonatomic) NSMutableArray *IncomeRiderPlanOption;
@property (retain, nonatomic) NSMutableArray *OtherRiderCode;
@property (retain, nonatomic) NSMutableArray *OtherRiderTerm;
@property (retain, nonatomic) NSMutableArray *OtherRiderDesc;
@property (retain, nonatomic) NSMutableArray *OtherRiderSA;
@property (retain, nonatomic) NSMutableArray *OtherRiderPlanOption;
@property (strong, nonatomic) DBController* db;
@property (strong, nonatomic) DataTable * dataTable;

#define IsAtLeastiOSVersion(X) ([[[UIDevice currentDevice] systemVersion] compare:X options:NSNumericSearch] != NSOrderedAscending)

@end
