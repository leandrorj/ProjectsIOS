//
//  ViewController.m
//  ProjetoTeste
//
//  Created by Siddhartha Freitas on 05/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "CustomTableViewCell.h"


@interface ViewController ()

@property NSDictionary *dados;

@property NSArray *arrayRetorno;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    AFHTTPRequestOperationManager	*manager	=	[AFHTTPRequestOperationManager
                                                     manager];
    [manager	GET:@"https://teste-aula-ios.herokuapp.com/comments.json"
      parameters:nil
         success:^(AFHTTPRequestOperation	*operation,	id responseObject)	{
             
             self.arrayRetorno = responseObject;
             
             [self.tableviewmy reloadData];
             
             NSLog(@"JSON:	%@",	responseObject);
         }				failure:^(AFHTTPRequestOperation	*operation,	NSError	*error)	{
             NSLog(@"Error:	%@",	error);		
         }];
    
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayRetorno.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    
    NSDictionary *dic = self.arrayRetorno[indexPath.row];
    
    cell.nome.text = dic[@"user"];
    cell.data.text = dic[@"content"];
    cell.comentario.text   = dic[@"created_at"];
//    cell.imagem.  = dic[@"pais"];

    return cell;
}




@end
