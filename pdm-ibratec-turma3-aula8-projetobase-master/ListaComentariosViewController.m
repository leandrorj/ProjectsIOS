//
//  ListaComentariosViewController.m
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import "ListaComentariosViewController.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "CommentTableViewCell.h"
#import <SVProgressHUD.h>
#import "MapViewController.h"

@interface ListaComentariosViewController ()

@property (strong) NSMutableArray *comments;
@property (nonatomic) int page;

@end

@implementation ListaComentariosViewController

- (void)viewDidLoad {
    
    self.comments = [NSMutableArray arrayWithArray: @[]];
    self.page = 1;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [self recarregarDados];
}

- (IBAction)recarregar:(id)sender {
    [self recarregarDados];
}

- (void) recarregarDados {
    self.page = 1;
      self.tempArray = self.comments;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [SVProgressHUD show];
    [manager GET:@"https://teste-aula-ios.herokuapp.com/comments.json"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [SVProgressHUD dismiss];
               //self.tempArray = self.comments;
             self.comments = [NSMutableArray arrayWithArray:responseObject];
             
             [self.tableView reloadData];
         }    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             [SVProgressHUD dismiss];
             NSLog(@"Error: %@", error);
         }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.comments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *comment = self.comments[indexPath.row];
    cell.userLabel.text    = comment[@"user"];
    cell.commentLabel.text = comment[@"content"];
    cell.dataLabel.text = [comment[@"created_at"] substringToIndex:10];
    [cell.m_imageView setImageWithURL:[NSURL URLWithString:comment[@"image"]]
                   placeholderImage:[UIImage imageNamed:@"vangogh"]];
    
    if (indexPath.row == [self.comments count] - 1) {
        // Última célula, tenta carregar mais
        [self carregaProximaPagina];
    }
    
    return cell;
}




-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length == 0)
    {
        self.comments  = self.tempArray;
    }
    else
    {
        NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"user contains[c] %@",searchText];
        self.comments  =[NSMutableArray arrayWithArray:[self.tempArray filteredArrayUsingPredicate:predicate]];
    }
    
    [self.tableView reloadData];
}

- (IBAction)sair:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


- (void) carregaProximaPagina {
    if (self.page == -1)
        return;
    self.page += 1;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    [manager GET:@"https://teste-aula-ios.herokuapp.com/comments.json"
      parameters:@{@"page":@(self.page)}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             if ([responseObject count] == 0) {
                 // This will stop pagination from happening
                 self.page = -1;
             } else {
                 [self.comments addObjectsFromArray:responseObject];
                 [self.tableView reloadData];
             }
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *myObj = self.comments[ indexPath.row];
    

    MapViewController * viewDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"abrirDetalheEMapa"];
    viewDetail.comment = myObj;
    [self.navigationController pushViewController:viewDetail animated:YES];

}







@end
