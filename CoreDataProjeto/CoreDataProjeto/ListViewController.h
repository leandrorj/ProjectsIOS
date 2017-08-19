//
//  ListViewController.h
//  CoreDataProjeto
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product+CoreDataClass.h"

@interface ListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) NSArray *array;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) Product *selectProd;


@property (strong, nonatomic) UIImagePickerController *imagePicker;


@end
