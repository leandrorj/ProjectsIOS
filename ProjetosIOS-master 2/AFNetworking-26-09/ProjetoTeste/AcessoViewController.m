//
//  AcessoViewController.m
//  ProjetoTeste
//
//  Created by Treinamento on 26/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "AcessoViewController.h"
#import <AFNetworking.h>
#import "ViewController.h"

@interface AcessoViewController ()

@end

@implementation AcessoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)acessoClick:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST: @"https://teste-aula-ios.herokuapp.com/users/sign_in.json"
       parameters:@{ @"user" : @{ @"email": @"crystian@roadmaps.com.br",
                                  @"password": @"12345678" } }
          success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull
                    responseObject) {
              NSLog(@"Login success");
              
              ViewController *viewControleComments = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
              
              [self.navigationController pushViewController:viewControleComments animated:YES];
              
          } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError *
                      _Nonnull error) {
              NSLog(@"Login failure");
          }];
    
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
