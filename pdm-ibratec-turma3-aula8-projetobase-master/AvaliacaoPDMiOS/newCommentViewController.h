//
//  newCommentViewController.h
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface newCommentViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *userTxt;
@property (weak, nonatomic) IBOutlet UITextView *comentarioTxt;
@property (weak, nonatomic) IBOutlet UIImageView *imagemEscolhida;

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) UIImagePickerController *imagePicker;

@end
