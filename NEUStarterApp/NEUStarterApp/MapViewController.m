//
//  MapViewController.m
//  NEUStarterApp
//
//  Created by Vega  on 15/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "MapViewController.h"
#define METERS_PER_MILE 1609.344
#import "SWRevealViewController.h"
@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    _imageView.image = [UIImage imageNamed:@"NEU-logo.png"];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

}
- (void)viewWillAppear:(BOOL)animated {

//    
    
    NSArray *name=[[NSArray alloc]initWithObjects:
                   @"Main Campus Entrance",
                   @"Centennial Common",
                   @"Curry Student center",
                   @"International Village",nil];
    self.annotation=[[NSMutableArray alloc]initWithCapacity:[name count]];
    
    MKPointAnnotation *mappin;
    
    CLLocationCoordinate2D location;
    location.latitude = 42.3398;
    location.longitude= -71.0892;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];

    
    location = CLLocationCoordinate2DMake(42.3398,-71.0892);
    mappin = [[MKPointAnnotation alloc]init];
    mappin.coordinate=location;
    mappin.title=[name objectAtIndex:0];
    [self.annotation addObject:mappin];
    
    mappin = [[MKPointAnnotation alloc]init];
    location = CLLocationCoordinate2DMake(42.3371,-71.0905);
    mappin.coordinate=location;
    mappin.title=[name objectAtIndex:1];
    [self.annotation addObject:mappin];
    
    mappin = [[MKPointAnnotation alloc]init];
    location = CLLocationCoordinate2DMake(42.3391,-71.0876);
    mappin.coordinate=location;
    mappin.title=[name objectAtIndex:2];
    [self.annotation addObject:mappin];
    
    mappin = [[MKPointAnnotation alloc]init];
    location = CLLocationCoordinate2DMake(42.337188,-71.091635);
    mappin.coordinate=location;
    mappin.title=[name objectAtIndex:3];
    [self.annotation addObject:mappin];
    
    [self.mapView addAnnotations:self.annotation];
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = YES;
    
    
    
    
    
}

//- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
//{
//    // Add an annotation
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    point.coordinate = userLocation.coordinate;
//    point.title = @"Where am I?";
//    point.subtitle = @"I'm here!!!";
//    
//    [self.mapView addAnnotation:point];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
