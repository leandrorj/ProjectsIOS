//
//  ViewController.h
//  ProjectCamera
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imagemCamera;

@end

