//
//  ViewController.m
//  NavigationProject
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "ViewController.h"
#import "AzulViewController.h"
#import "AmareloViewController.h"
#import "VermelhoViewController.h"

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


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if([identifier isEqualToString:@"segueAzul"])
    {
        if(self.valor1 < self.valor2)
            return YES;
        else
            return NO;
        
    }
    return YES;
}



 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"segueAzul"]){
        
        AzulViewController *azulViewController = [segue destinationViewController];
        azulViewController.nome = @"Paulo teste azul";
        
    }else if([segue.identifier isEqualToString:@"segueAmarelo"]){
        
        AmareloViewController *amareloViewController = [segue destinationViewController];
        amareloViewController.nomeA = @"Paulo teste amarelo";
        
    }else if([segue.identifier isEqualToString:@"segueVermelho"]){
        VermelhoViewController *vermelhoViewController = [segue destinationViewController];
        
        vermelhoViewController.nomeVer = @"Paulo teste vermelho";
    }
}



@end
