//
//  BKZMasterViewController.m
//  MapGoogle
//
//  Created by manit on 12/2/2558.
//  Copyright (c) พ.ศ. 2558 pendidikan. All rights reserved.
//

#import "BKZMasterViewController.h"
#import "Menu.h"
#import "BKZMapView.h"

@interface BKZMasterViewController ()

@end

@implementation BKZMasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"GoogleMap API";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[Menu loadSections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[Menu loadMenu][section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [Menu loadSections][section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                   forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [Menu loadMenu][indexPath.section][indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BKZMapView * mvc = [[BKZMapView alloc] init];
    [self.navigationController pushViewController:mvc animated:YES];
}

@end
