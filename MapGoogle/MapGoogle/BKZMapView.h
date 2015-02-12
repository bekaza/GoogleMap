//
//  BKZMap.h
//  MapGoogle
//
//  Created by manit on 12/2/2558.
//  Copyright (c) พ.ศ. 2558 pendidikan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface BKZMapView : UIViewController <GMSMapViewDelegate>

@property (nonatomic) GMSMapView *map;

@end
