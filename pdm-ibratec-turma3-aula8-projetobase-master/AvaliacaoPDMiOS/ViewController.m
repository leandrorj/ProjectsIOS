//
//  ViewController.m
//  AvaliacaoPDMiOS
//
//  Created by Crystian Leão on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

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


- (IBAction)acessoClick:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *email = self.nomeUsuario.text;
    NSString *senha = self.nomeSenha.text;
    
    NSDictionary *parameters = @{ @"user" : @{ @"email":email,
                                               @"password":senha } };
    
    [SVProgressHUD show];
    [manager POST: @"https://teste-aula-ios.herokuapp.com/users/sign_in.json"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject){
              NSLog(@"Você está logado!");
              
              UIStoryboard *storyboard = self.storyboard;
              
              UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
              
              [self presentViewController:viewController animated: YES completion:nil];
              
              [SVProgressHUD dismiss];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error){
              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro ao Logar-se!"
                                                              message:@"Por favor check seu email e senha."
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                                    otherButtonTitles:@"OK", nil];
              [SVProgressHUD dismiss];
              [alert show];
              //NSLog(@"Erro ao Logar-se!");
              
          }];
  
}


@end
