//
//  TableViewController.h
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Produtos+CoreDataClass.h"

@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *arrayProducts;
@property (strong, nonatomic) Produtos *produtoSelecionado;
@property (strong, nonatomic) UIImagePickerController *imagePicker;

@end
