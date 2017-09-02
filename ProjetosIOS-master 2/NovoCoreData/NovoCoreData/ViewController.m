//
//  ViewController.m
//  NovoCoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "ViewController.h"
#import "Product+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)save:(id)sender {
    
    NSDictionary *dic = @{@"Nome": self.textNome.text,
                          @"Marca": self.textMarca.text,
                          @"Quantidade": self.textQuantidade.text};
    
    [Product novoProduto:dic];
    
    self.textNome.text = @"";
    self.textMarca.text = @"";
    self.textQuantidade.text = @"";
}


@end
