//
//  SegundoViewController.m
//  ProjetoApress
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "SegundoViewController.h"
#import "CustomTableViewCell.h"

@interface SegundoViewController ()

@end

@implementation SegundoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.arraySemana = @[@"Segunda", @"Terça", @"Quarta", @"Quinta", @"Sexta"];
    
    NSDictionary *dictionary = @{@"nome": @"Lala",
                                 @"email": @"Lala",
                                 @"rua": @"Lala",
                                 @"pais": @"Lala"};
    
    NSDictionary *dictionary2 = @{@"nome": @"Lala 2",
                                 @"email": @"email2",
                                 @"rua": @"rua2",
                                 @"pais": @"Lala2"};
    
    self.arraySemana = @[dictionary, dictionary2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arraySemana.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    NSDictionary *dic = self.arraySemana[indexPath.row];
    
    cell.labelNome.text = dic[@"nome"];
    cell.labelEmail.text = dic[@"email"];
    cell.labelRua.text   = dic[@"rua"];
    cell.labelPais.text  = dic[@"pais"];
    
//    cell.labelEmail.text = @"Lala email";
//    cell.labelRua.text   = @"Lala Rua";
//    cell.labelPais.text  = @"Lala pais";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellLaranja" forIndexPath:indexPath];
    
//    cell.textLabel.text = self.arraySemana[indexPath.row];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
