//
//  ViewController.m
//  MapExample
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "ViewController.h"
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
   
    
    [self initLocationService];
    
    
    if (IS_OS_8_OR_LATER) {
        NSUInteger code = [CLLocationManager authorizationStatus];
        if (code == kCLAuthorizationStatusNotDetermined && ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)] || [self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
            // choose one request according to your business.
            if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                [self.locationManager  requestWhenInUseAuthorization];
            } else {
                NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
            }
        }
        
    }
    [super viewDidLoad];
    [self addGestureToMap];
    [self startSearch:@"Olinda, Pernambuco"];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)getLocation:(id)sender {
    NSLog(@"lat = %f", self.locationManager.location.coordinate.latitude);
    NSLog(@"lng = %f", self.locationManager.location.coordinate.longitude);
    [self centerMap];
    [self colectAddress];
    [self setPinOnMap:self.locationManager.location];
    
}


- (IBAction)removeLocation:(id)sender {
    [self.mapView removeAnnotations:self.mapView.annotations];
}



-(void) centerMap{
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = self.locationManager.location.coordinate.latitude;
    newRegion.center.longitude = self.locationManager.location.coordinate.longitude;
    newRegion.span.latitudeDelta = 0.0005;
    newRegion.span.longitudeDelta = 0.0005;
    
    [self.mapView setRegion:newRegion];
    
}


-(void)colectAddress{
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:self.locationManager.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark = placemarks[0];
        NSLog(@"%@", placemark.thoroughfare);
        NSLog(@"%@", placemark.subLocality);
    }];
}

-(void)startSearch:(NSString *)searchString {
    
    if (self.localSearch.searching)
    {
        [self.localSearch cancel];
    }
    
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = self.locationManager.location.coordinate.latitude+0.001555;
    newRegion.center.longitude = self.locationManager.location.coordinate.longitude;
    
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    
    request.naturalLanguageQuery = searchString;
    request.region = newRegion;
    
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error) {
        
        if (error != nil) {
            [self.localSearch cancel];
            self.localSearch = nil;
            NSLog(@"Erro");
        } else {
            if([response mapItems].count > 0){
               //MKMapItem *item = [response mapItems][0];
               // item.placemark.name;
            }else{
                NSLog(@"Erro");
            }
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    };
    
    if (self.localSearch != nil) {
        self.localSearch = nil;
    }
    self.localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [self.localSearch startWithCompletionHandler:completionHandler];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (IBAction)buscar:(id)sender {
    
    [self startSearch: self.labelText.text];
}

-(void) initLocationService{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [self.locationManager startUpdatingHeading];
}


-(void)setPinOnMap:(CLLocation *)location{
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    MKCoordinateRegion region;
    region.center.latitude = location.coordinate.latitude;
    region.center.longitude = location.coordinate.longitude;
    annotation.coordinate = region.center;
    annotation.title = @"lala";
    annotation.subtitle = @"lalal123";
    
    [self.mapView addAnnotation:annotation];
}




-(void)addGestureToMap{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMap:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    tapGesture.delaysTouchesBegan = YES;
    
    [tapGesture setCancelsTouchesInView:YES];
    [self.mapView addGestureRecognizer:tapGesture];
}

-(void)tapMap:(UITapGestureRecognizer *)recognizer{
    CGPoint touchPoint = [recognizer locationInView:self.mapView];
    
    CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    CLLocation *location  = [[CLLocation alloc] initWithLatitude:touchMapCoordinate.latitude longitude:touchMapCoordinate.longitude];
    
    [self setPinOnMap:location];
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    UIImage *image = [UIImage imageNamed:@"mapaImg"];
    
    MKAnnotationView *pinView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"mapPin"];
    
    if(pinView != nil){
        pinView.annotation = annotation;
    }else{
        pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapPin"];
        pinView.image = image;
        pinView.centerOffset = CGPointMake(0, -pinView.image.size.height / 2);
        
    }
    return pinView;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
