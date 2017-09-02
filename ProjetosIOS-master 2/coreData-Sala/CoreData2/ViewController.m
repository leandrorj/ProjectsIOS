//
//  ViewController.m
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "ViewController.h"
#import "Produtos+CoreDataClass.h"

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

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[self.view endEditing:YES];
	return YES;
}

- (IBAction)gravarDados:(id)sender {
	NSDictionary *dic = @{@"nome":self.nomeTextField.text,
						  @"marca":self.marcaTextField.text,
						  @"quantidade": @(10)};
	[Produtos novoProduto:dic];
	
	self.marcaTextField.text = @"";
	self.nomeTextField.text = @"";
	
}


@end
