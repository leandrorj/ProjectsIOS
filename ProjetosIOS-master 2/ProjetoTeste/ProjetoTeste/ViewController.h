//
//  ViewController.h
//  ProjetoTeste
//
//  Created by Siddhartha Freitas on 05/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableviewmy;

@end

