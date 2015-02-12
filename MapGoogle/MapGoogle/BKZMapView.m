//
//  BKZMap.m
//  MapGoogle
//
//  Created by manit on 12/2/2558.
//  Copyright (c) พ.ศ. 2558 pendidikan. All rights reserved.
//

#import "BKZMapView.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation BKZMapView

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:18.767515
                                                            longitude:99.003848
                                                                 zoom:16];
    _map = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    self.view = _map;
    
}

@end
