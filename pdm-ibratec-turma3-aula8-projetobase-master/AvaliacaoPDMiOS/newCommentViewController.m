//
//  newCommentViewController.m
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import "newCommentViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MapKit/MapKit.h>

@interface newCommentViewController ()

@end

@implementation newCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate =self;
    NSUInteger code = [CLLocationManager authorizationStatus];
    if (code ==kCLAuthorizationStatusNotDetermined && ( [_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)] ) ){
        if ([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescryption"]){
            [_locationManager requestWhenInUseAuthorization];
        }
    } else {
        NSLog(@"Info.plist does not contain NSLoCationAlwaysUsageDEscryption or NSLocationWhenInUseUsageDescryption ");
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)CarregarImagem:(id)sender {
    [self startCameraControllerFromViewController:self usingDelegate:self];
}






- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>)delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypePhotoLibrary] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    cameraUI.mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypePhotoLibrary];
    cameraUI.allowsEditing = NO;
    
    cameraUI.delegate = delegate;
    [controller presentViewController: cameraUI animated: YES completion:nil];
    return YES;
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if ([mediaType isEqualToString:@"public.image"]) {
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        
        //UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
        self.imagemEscolhida.image = imageToSave;
        
    }
    
    // Handle a movie capture
    /*if ([mediaType isEqualToString:@"public.movie"]) {
     
     NSString *moviePath = [[info objectForKey: UIImagePickerControllerMediaURL] path];
     
     if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath)) {
     UISaveVideoAtPathToSavedPhotosAlbum(moviePath, nil, nil, nil);
     }
     }*/
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}









- (IBAction)salvarComentario:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    double lat = self.locationManager.location.coordinate.latitude;
    double lng = self.locationManager.location.coordinate.longitude;
    
    
    NSDictionary *parameters = @{
                                 @"comment[user]":self.userTxt.text,
                                 @"comment[content]":self.comentarioTxt.text
                                 
                                 };
    
    NSData *imageData= UIImageJPEGRepresentation(self.imagemEscolhida.image, 0.5);
    
    [SVProgressHUD show];
    [manager  POST:@"https://teste-aula-ios.herokuapp.com/comments.json"
        parameters:parameters
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileData:imageData name:@"comment[picture]" fileName:@"Teste" mimeType:@"image/jpeg"];
} success:^(AFHTTPRequestOperation *operation, id responseObject) {
    [SVProgressHUD dismiss];
    [self.navigationController popViewControllerAnimated:YES];
}           failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    [SVProgressHUD dismiss];
    [self.navigationController popViewControllerAnimated:YES];
}];
    
}


- (IBAction)cancelarComentario:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}



- (IBAction)pegarImagem:(id)sender {
    
    //    UIView *view = sender;
    //
    //    while (![view isKindOfClass:[UITableViewCell class]]) {
    //        view = [view superview];
    //    }
    
    //    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)view];
    
    //self.produtoSelecionado = self.arrayProducts[indexPath.row];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"AViso" message:@"Escolha" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.imagePicker =  [[UIImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:self.imagePicker animated:YES completion:nil];
        
        
    }];
    
    UIAlertAction *galeryAction = [UIAlertAction actionWithTitle:@"Galeria" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePicker =  [[UIImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }];
    
    [alert addAction:photoAction];
    [alert addAction:galeryAction];
    [self presentViewController:alert animated:YES completion:nil];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (void) initLocationService{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [self.locationManager startUpdatingLocation];
}






@end
