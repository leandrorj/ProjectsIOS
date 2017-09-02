//
//  ViewController.h
//  ProjectAnimation
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myView.h"

@interface ViewController : UIViewController

@property(strong, nonatomic)myView *myView;

@property (weak, nonatomic) IBOutlet UITextField *searchBar;

@end

