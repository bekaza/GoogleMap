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
    return @[@"Map", @"Direction"];
}

+(NSDictionary *)loadMenu
{
    NSArray * mapDemo = @[@"MapBasic", @"MapType"];
    NSArray * Direct = @[@"2 Mark Direction"];
    
    NSDictionary *allMenu = @{@"Map": mapDemo, @"Direction": Direct};
    
    return allMenu;
}

- (NSDictionary *)newDemo:(Class) class
                withTitle:(NSString *)title
           andDescription:(NSString *)description {
    return [[NSDictionary alloc] initWithObjectsAndKeys:class, @"controller",
            title, @"title", description, @"description", nil];
}
@end
