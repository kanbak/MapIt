//
//  ViewController.m
//  MapIt
//
//  Created by Umut Kanbak on 7/29/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocationManager *locationManager;
    MKMapView *mapView;
__weak IBOutlet MKMapView *mapViewOutlet;
    MKCoordinateRegion myRegion;
    
    __weak IBOutlet UITextField *latitudeTextField;
    __weak IBOutlet UITextField *longitudeTextField;
    float latitudeTextFieldInput;
    float longitudeTextFieldInput;
    
}
- (IBAction)goToAddress:(id)sender;

- (IBAction)goToMMButton:(id)sender;

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager=[[CLLocationManager alloc]init];
    locationManager.delegate =self;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"Location = %@",[locations objectAtIndex:0]);
    
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"eror %@",error);
}



- (IBAction)goToAddress:(id)sender {
    latitudeTextFieldInput=[latitudeTextField.text floatValue];
    longitudeTextFieldInput=[longitudeTextField.text floatValue];
    myRegion.center= CLLocationCoordinate2DMake(latitudeTextFieldInput, longitudeTextFieldInput);
    myRegion.span.latitudeDelta=0.03;
    myRegion.span.longitudeDelta=0.03;
    [mapViewOutlet setRegion:myRegion animated:YES];
    NSLog(@"Latitude %f Longitude %f", latitudeTextFieldInput, longitudeTextFieldInput);
    [latitudeTextField resignFirstResponder];
    [longitudeTextField resignFirstResponder];
}

- (IBAction)goToMMButton:(id)sender {
    
    myRegion.center= CLLocationCoordinate2DMake(41.893740, -87.635330);
    myRegion.span.latitudeDelta=0.03;
    myRegion.span.longitudeDelta=0.03;
    [mapViewOutlet setRegion:myRegion animated:YES];
    
}
@end
