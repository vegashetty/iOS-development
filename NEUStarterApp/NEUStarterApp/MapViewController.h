//
//  MapViewController.h
//  NEUStarterApp
//
//  Created by Vega  on 15/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapViewController : UIViewController  <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) NSMutableArray *annotation;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
