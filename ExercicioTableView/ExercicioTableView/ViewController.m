//
//  ViewController.m
//  ExercicioTableView
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSDictionary * bairros;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.bairros = @{@"Zona Norte": @[@"Recife Antigo"]};
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *) tableView {
    return self.bairros.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString * regiao = self.bairros.allKeys[section];
    return [self.bairros[regiao] count];
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *regiao = self.bairros.allKeys[indexPath.section];
    NSString *bairro = self.bairros[regiao][indexPath.row];
    cell.textLabel.text =  bairro;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString * regiao = self.bairros.allKeys[section];
    return regiao;
}

@end
