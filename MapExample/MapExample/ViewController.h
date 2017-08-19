//
//  ViewController.h
//  MapExample
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) MKLocalSearch *localSearch;

@property (weak, nonatomic) IBOutlet UITextField *labelText;


@property (weak, nonatomic) IBOutlet UILabel *endereco;

@end

