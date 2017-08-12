//
//  ViewController.m
//  PrimeiroProjeto
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "ViewController.h"
#import "SegundoViewController.h"

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

- (IBAction)changeLabel:(id)sender {
//    self.minhaLabel.text = @"paulo";
    [self nomelala:@"Lala"];
}

- (IBAction)limparLabel:(id)sender {
    self.minhaLabel.text = @"";
}


- (void)nomelala: (NSString *)texto{
    NSString * novaString = [NSString stringWithFormat:@"O nome é %@", texto];
    //self.minhaLabel.text = novaString;
    
    [self nomelala:texto segundoParametro:novaString];
}

- (void)nomelala: (NSString *)texto segundoParametro: (NSString *)parametro2{
    
    NSString * novastring = [NSString stringWithFormat:@"O nome é %@ e %@", texto, parametro2];
    
    self.minhaLabel.text = novastring;
}


- (IBAction)alterarNomeDoBotao:(id)sender {
    [self.botaoGrande setTitle:@"lalla" forState:UIControlStateNormal];
}

- (IBAction)chamarViewController:(id)sender {
    
    NSArray *array = @[@"Sidd", @"Paulo"];
    
    SegundoViewController * segViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SegundoViewController"];
    
    segViewController.nome = @"Qualquer coisa";
    segViewController.array = array;
    [self presentViewController:segViewController animated:YES completion:nil];
    
    
}


@end
