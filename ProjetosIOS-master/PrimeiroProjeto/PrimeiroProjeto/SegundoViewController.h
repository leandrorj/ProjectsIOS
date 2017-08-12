//
//  SegundoViewController.h
//  PrimeiroProjeto
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegundoViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSArray *array;

@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *senhaField;


@end
