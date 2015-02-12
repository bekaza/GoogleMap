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

@property (nonatomic) NSMutableArray * Section__;
@property (nonatomic) NSMutableDictionary * Menu__;

@end

@implementation BKZMasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        
        self.Section__ = [[NSMutableArray alloc] initWithArray:[Menu loadSections]];
        self.Menu__ = [[NSMutableDictionary  alloc] init];
        [self.Menu__ addEntriesFromDictionary:[Menu loadMenu]];
        
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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    //[self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.Section__ count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString * sec = self.Section__[section];
    return [self.Menu__[sec] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.Section__[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                   forIndexPath:indexPath];
    
    // Configure the cell...
    NSString * sec = self.Section__[indexPath.section];
    cell.textLabel.text = self.Menu__[sec][indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BKZMapView * mv = [[BKZMapView alloc] init];
    
    [self.navigationController pushViewController:mv animated:YES];
}

@end
