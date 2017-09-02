//
//  CustomTableViewCell.h
//  ProjetoTeste
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UILabel *comentario;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;

@end
