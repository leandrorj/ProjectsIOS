//
//  ViewController.h
//  MapExemple
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property(strong, nonatomic) UITapGestureRecognizer *gestureRecognizer;

@property(strong, nonatomic) MKLocalSearch *localSearch;

@property(strong, nonatomic) NSArray *myArray;

@property (strong, nonatomic) IBOutlet UITextField *textLocal;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;



@end

