//
//  TableViewController.m
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "TableViewController.h"
#import "Produtos+CoreDataClass.h"
#import "Fotos+CoreDataClass.h"
#import "PhotoViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.arrayProducts = [Produtos todosProdutos];
    // Do any additional setup after loading the view.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.arrayProducts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
	
	Produtos *prod = self.arrayProducts[indexPath.row];
	
	cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", prod.nome, prod.marca];
	
	return cell;
}

- (IBAction)addImage:(id)sender {
	UIView *view = sender;
	
	while (![view isKindOfClass:[UITableViewCell class]]) {
		view = [view superview];
	}
	
	NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)view];
	
	self.produtoSelecionado = self.arrayProducts[indexPath.row];
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"AViso" message:@"Escolha" preferredStyle:UIAlertControllerStyleActionSheet];
	
	UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		
		self.imagePicker =  [[UIImagePickerController alloc] init];
		self.imagePicker.delegate = self;
		self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
		
		[self presentViewController:self.imagePicker animated:YES completion:nil];

		
	}];
	
	UIAlertAction *galeryAction = [UIAlertAction actionWithTitle:@"Galeria" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		self.imagePicker =  [[UIImagePickerController alloc] init];
		self.imagePicker.delegate = self;
		self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		
		[self presentViewController:self.imagePicker animated:YES completion:nil];
	}];
	
	[alert addAction:photoAction];
	[alert addAction:galeryAction];
	[self presentViewController:alert animated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
	[picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText

{
    if(searchText.length!=0){
        
        self.arrayProducts = [Produtos produtosComNome:searchText ];
        
        [self.tableView reloadData];
        
    } else{
        self.arrayProducts = [Produtos todosProdutos];
        [self.tableView reloadData];

    }
}




	// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
	
	UIImage *originalImage, *editedImage, *imageToSave;
	
		// Handle a still image capture
			editedImage = (UIImage *) info[UIImagePickerControllerEditedImage];
		originalImage = (UIImage *) info[UIImagePickerControllerOriginalImage];
		
		if (editedImage) {
			imageToSave = editedImage;
		} else {
			imageToSave = originalImage;
		}
		
			// Save the new image (original or edited) to the Camera Roll
		if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
			UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
		
		UIImage *image = imageToSave;
	NSDictionary *dic = @{@"imagem": image, @"produto": self.produtoSelecionado};
	[Fotos novaFoto:dic];
	
	[picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
	
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	PhotoViewController *photoViewController = [self.storyboard instantiateViewControllerWithIdentifier: @"PhotoViewController"];
	
	photoViewController.prod = self.arrayProducts[indexPath.row];
	
	[self.navigationController pushViewController:photoViewController animated:YES];
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
