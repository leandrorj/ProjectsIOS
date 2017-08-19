//
//  ViewController.m
//  ProjectCamera
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)capturarFoto:(id)sender {
    
    [self startCameraControllerFromViewController:self usingDelegate:self];
    
    
}




- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller  usingDelegate: (id <UIImagePickerControllerDelegate,UINavigationControllerDelegate>)delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:  UIImagePickerControllerSourceTypePhotoLibrary] == NO)
        || (delegate == nil)
        || (controller == nil))  return NO;
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];  cameraUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    cameraUI.mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypePhotoLibrary];
    cameraUI.allowsEditing = NO;
    
    cameraUI.delegate = delegate; 
    [controller presentViewController: cameraUI animated: YES completion:nil];  return YES; 
}



@end
