//
//  myView.h
//  ProjectAnimation
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myView : UIView
@property (weak, nonatomic) IBOutlet UIButton *buttonUse;

@property (weak, nonatomic) IBOutlet UIButton *buttonBack;


-(void)ocultarElementos;

-(void)exibirElementos;


@end
