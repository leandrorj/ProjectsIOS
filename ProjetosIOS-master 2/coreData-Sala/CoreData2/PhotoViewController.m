//
//  PhotoViewController.m
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "PhotoViewController.h"

#import "PhotoTableViewCell.h"
#import "Fotos+CoreDataClass.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.prod.fotos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
	Fotos *foto = self.prod.fotos.allObjects[indexPath.row];
	
	cell.image.image = [UIImage imageWithData:foto.imagem];
	
	return cell;
	
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
