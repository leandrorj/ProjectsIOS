//
//  ListaComentariosViewController.h
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaComentariosViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSDictionary * comment;
@property (nonatomic,strong) NSMutableArray *tempArray;



@end
