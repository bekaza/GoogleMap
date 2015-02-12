//
//  Menu.m
//  MapGoogle
//
//  Created by manit on 12/2/2558.
//  Copyright (c) พ.ศ. 2558 pendidikan. All rights reserved.
//

#import "Menu.h"

@implementation Menu

+(NSArray *)loadSections
{
    return @[@"Map", @"Diretions"];
}

+(NSArray *)loadMenu
{
    NSArray * mapDemo = @[@"MapBasic"];
    NSArray * Direct = @[@"2 Mark"];
    
    return @[mapDemo,Direct];
}
@end
