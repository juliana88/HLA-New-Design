//
//  RiderListTbViewController.m
//  HLA
//
//  Created by shawal sapuan on 8/29/12.
//  Copyright (c) 2012 InfoConnect Sdn Bhd. All rights reserved.
//

#import "RiderListTbViewController.h"

@interface RiderListTbViewController ()

@end

@implementation RiderListTbViewController
@synthesize requestPtype,requestSeq,ridCode,ridDesc,selectedCode,selectedDesc,requestOccpClass,requestAge;
@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"RIDERLIST ptype:%@, seq:%d class:%d",[self.requestPtype description],self.requestSeq,self.requestOccpClass);
    
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"hladb.sqlite"]];
    
    [self getRiderListing];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void)getRiderListing
{
    ridCode = [[NSMutableArray alloc] init];
    ridDesc = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    NSString *querySQL;
    if (sqlite3_open([databasePath UTF8String], &contactDB) == SQLITE_OK)
    {
        if (self.requestOccpClass > 4) {
            querySQL = [NSString stringWithFormat:
            @"SELECT a.RiderCode,b.RiderDesc FROM Trad_Sys_RiderComb a LEFT JOIN Trad_Sys_Rider_Profile b ON a.RiderCode=b.RiderCode WHERE a.PlanCode=\"HLAIB\" AND a.PTypeCode=\"%@\" AND a.Seq=\"%d\" AND a.RiderCode != \"CPA\" AND a.RiderCode != \"PA\" AND a.RiderCode != \"HMM\" AND a.RiderCode != \"HB\" AND a.RiderCode != \"MG_II\" AND a.RiderCode != \"MG_IV\" AND a.RiderCode != \"HSP_II\"",[self.requestPtype description],self.requestSeq];
        }
        else if (self.requestAge > 60) {
            querySQL = [NSString stringWithFormat:
                @"SELECT a.RiderCode,b.RiderDesc FROM Trad_Sys_RiderComb a LEFT JOIN Trad_Sys_Rider_Profile b ON a.RiderCode=b.RiderCode WHERE a.PlanCode=\"HLAIB\" AND a.PTypeCode=\"%@\" AND a.Seq=\"%d\" AND a.RiderCode != \"C+\" AND a.RiderCode != \"CCTR\" AND a.RiderCode != \"CIR\" AND a.RiderCode != \"CPA\" AND a.RiderCode != \"ETPD\" AND a.RiderCode != \"HB\" AND a.RiderCode != \"HSP_II\" AND a.RiderCode != \"I20R\" AND a.RiderCode != \"I30R\" AND a.RiderCode != \"I40R\" AND a.RiderCode != \"ICR\" AND a.RiderCode != \"ID20R\" AND a.RiderCode != \"ID30R\" AND a.RiderCode != \"ID40R\" AND a.RiderCode != \"IE20R\" AND a.RiderCode != \"IE30R\" AND a.RiderCode != \"LCPR\" AND a.RiderCode != \"MG_II\"",[self.requestPtype description],self.requestSeq];
        }
        else {
            querySQL = [NSString stringWithFormat:
                        @"SELECT a.RiderCode,b.RiderDesc FROM Trad_Sys_RiderComb a LEFT JOIN Trad_Sys_Rider_Profile b ON a.RiderCode=b.RiderCode WHERE a.PlanCode=\"HLAIB\" AND a.PTypeCode=\"%@\" AND a.Seq=\"%d\"",[self.requestPtype description],self.requestSeq];
        }
        
        if (sqlite3_prepare_v2(contactDB, [querySQL UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                [ridCode addObject:[[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)]];
                [ridDesc addObject:[[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)]];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ridDesc count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *itemDesc = [ridDesc objectAtIndex:indexPath.row];
    NSString *itemcode = [ridCode objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@",itemcode,itemDesc];
    
	if (indexPath.row == selectedIndex) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex = indexPath.row;
    [_delegate RiderListController:self didSelectCode:self.selectedCode desc:self.selectedDesc];
    [tableView reloadData];
}

-(NSString *)selectedCode
{
    return [ridCode objectAtIndex:selectedIndex];
}

-(NSString *)selectedDesc
{
    return [ridDesc objectAtIndex:selectedIndex];
}

#pragma mark - Memory management

- (void)viewDidUnload
{
    [self setDelegate:nil];
    [self setRequestPtype:nil];
    [self setRidCode:nil];
    [self setRidDesc:nil];
    [super viewDidUnload];
}

@end
