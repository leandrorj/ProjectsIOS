//
//  VermelhoViewController.m
//  NavigationProject
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "VermelhoViewController.h"

@interface VermelhoViewController ()

@end

@implementation VermelhoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.labelVer.text = _nomeVer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
