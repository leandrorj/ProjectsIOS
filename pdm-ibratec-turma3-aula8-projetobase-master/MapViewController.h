//
//  MapViewController.h
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *imagemView;
@property (strong, nonatomic) IBOutlet UITextField *nomeView;
@property (strong, nonatomic) IBOutlet UITextField *dataView;
@property (strong, nonatomic) IBOutlet UITextView *comentarioView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSDictionary * comment; 

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) MKLocalSearch *localSearch;

@end
