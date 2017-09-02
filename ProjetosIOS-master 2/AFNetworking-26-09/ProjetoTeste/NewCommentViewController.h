//
//  NewCommentViewController.h
//  ProjetoTeste
//
//  Created by Crystian Leao on 05/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCommentViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userTxt;
@property (weak, nonatomic) IBOutlet UITextView *commentTxt;

@property (strong, nonatomic) UIImage *imagemEscolhida;

//@property (strong, nonatomic) Produtos *produtoSelecionado;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end
