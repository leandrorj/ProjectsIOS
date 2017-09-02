//
//  CommentTableViewCell.h
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *m_imageView;


@property (weak, nonatomic) IBOutlet UITextField *userLabel;

@property (weak, nonatomic) IBOutlet UITextField *dataLabel;


@property (weak, nonatomic) IBOutlet UITextView *commentLabel;



@end
