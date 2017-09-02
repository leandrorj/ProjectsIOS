//
//  ViewController.m
//  ProjetoImage
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

- (IBAction)obterFoto:(id)sender {
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller  usingDelegate: (id <UIImagePickerControllerDelegate,
                                                                                                  UINavigationControllerDelegate>)delegate {
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {  NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if ([mediaType isEqualToString:@"public.image"]) {
        editedImage = (UIImage *) [info objectForKey:  UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:  UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToSave = editedImage;  } else {
                imageToSave = originalImage;  }
        
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);  }
    
    // Handle a movie capture
    if ([mediaType isEqualToString:@"public.movie"]) {
        
        NSString *moviePath = [[info objectForKey: UIImagePickerControllerMediaURL] path];
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath)) {
            UISaveVideoAtPathToSavedPhotosAlbum(moviePath, nil, nil, nil);  }
    }   
    [[picker parentViewController] dismissViewControllerAnimated:YES completion:nil];  }
@end
