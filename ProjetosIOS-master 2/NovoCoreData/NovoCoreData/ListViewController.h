//
//  ListViewController.h
//  NovoCoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "ViewController.h"
#import "Product+CoreDataClass.h"

@interface ListViewController : ViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property(strong, nonatomic) NSArray *myarray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong, nonatomic) Product *selectProd;

@property(strong, nonatomic) UIImagePickerController *imagePicker;

@end
