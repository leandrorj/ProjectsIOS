//
//  ViewController.m
//  ProjetoApress
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btnEntrar.layer.cornerRadius = 20;
    
    self.btnEntrar.hidden = true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickSegmento:(id)sender {
    
    if(_segmento.selectedSegmentIndex == 1){
        self.btnEntrar.hidden = NO;
    }
    
    if(_segmento.selectedSegmentIndex == 0){
        self.btnEntrar.hidden = YES;
    }
}

- (IBAction)eventoSlider:(UISlider *)sender {
    
    self.labelValor.text = [NSString stringWithFormat:@"%i", (int) sender.value];
}


- (IBAction)clickBotaoEntrar:(id)sender {
    
}


@end
