//
//  BKZMap.m
//  MapGoogle
//
//  Created by manit on 12/2/2558.
//  Copyright (c) พ.ศ. 2558 pendidikan. All rights reserved.
//

#import "BKZMapView.h"
#import <GoogleMaps/GoogleMaps.h>
#import "MDDirectionService.h"

@interface BKZMapView (){
    GMSMarker * _destination;
    GMSMarker * _Here;
    GMSPolyline * polyLine;
}

@end

@implementation BKZMapView

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:18.767515
                                                            longitude:99.003848
                                                                 zoom:14];
    _map = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    _map.delegate = self;
    self.view = _map;
    
    if (!_Here) {
        _Here = [[GMSMarker alloc] init];
    }
    
    _Here.position = CLLocationCoordinate2DMake(18.767515,99.003848);
    _Here.map = _map;
    _map.selectedMarker = _Here;
    
}

-(void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    if (!_destination) {
        _destination = [GMSMarker markerWithPosition:coordinate];
    }
    
    _destination.position = coordinate;
    _destination.title = @"Destination";
    _destination.map = _map;
    
    NSString * waypointString_ = [[NSString alloc] initWithFormat:@"%f,%f"
                                ,coordinate.latitude,coordinate.longitude];
    NSString * sensor = @"false";
    
    NSString * HereString_ = [[NSString alloc] initWithFormat:@"%f,%f"
                              ,_Here.position.latitude, _Here.position.longitude];
    
    NSMutableArray * point = [[NSMutableArray alloc] init];
    [point addObject:waypointString_];
    [point addObject:HereString_];
    
    NSArray *parameters = [NSArray arrayWithObjects:sensor, point, nil];
    NSArray *keys = [NSArray arrayWithObjects:@"sensor", @"waypoints", nil];
    
    NSDictionary *query = [NSDictionary dictionaryWithObjects:parameters
                                                      forKeys:keys];
    MDDirectionService *mds=[[MDDirectionService alloc] init];
    SEL selector = @selector(addDirections:);
    [mds setDirectionsQuery:query
               withSelector:selector
               withDelegate:self];
}


- (void)addDirections:(NSDictionary *)json {
    
    NSDictionary *routes = [json objectForKey:@"routes"][0];
    
    NSDictionary *route = [routes objectForKey:@"overview_polyline"];
    NSString *overview_route = [route objectForKey:@"points"];
    GMSPath *path = [GMSPath pathFromEncodedPath:overview_route];
    if (polyLine) {
        polyLine.map = nil;
    }
    polyLine = [GMSPolyline polylineWithPath:path];
    polyLine.map = _map;
    
    NSArray * legs = routes[@"legs"];
    NSLog(@"%@", [[legs[0] objectForKey:@"distance"] objectForKey:@"text"]);
    
    //NSLog(@"%@", [legs objectForKey:@"distance"]);
}
@end
