//
//  Produtos+CoreDataClass.m
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "Produtos+CoreDataClass.h"
#import "Fotos+CoreDataClass.h"
#import "AppDelegate.h"

@implementation Produtos

- (void) fillWithAttributes: (NSDictionary *) attributes {
	id t;
	
	t = [attributes valueForKeyPath:@"nome"];
	if (t != nil && ![t isKindOfClass:[NSNull class]])
		self.nome = [t description];
	
	t = [attributes valueForKeyPath:@"marca"];
	if (t != nil && ![t isKindOfClass:[NSNull class]])
		self.marca = [t description];
	
	t = [attributes valueForKeyPath:@"quantidade"];
	if (t != nil && ![t isKindOfClass:[NSNull class]])
		self.quantidade = @([t integerValue]);
	
}


+(Produtos *)novoProduto:(NSDictionary *)elements{
	AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
	Produtos *prod = [NSEntityDescription
					  insertNewObjectForEntityForName:@"Produtos"
					  inManagedObjectContext:appDelegate.persistentContainer.viewContext];
	[prod fillWithAttributes:elements];
	
	NSError *saveError = nil;
	[appDelegate.persistentContainer.viewContext save:&saveError];
	return prod;
}

+(NSArray *) todosProdutos {
	
	AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Produtos"];
	NSError *error;
	NSArray *produtos = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
	return produtos ;
}

+(Produtos *) produtoComNome:(NSString *)nome {
	
	AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nome == %@", nome];
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Produtos"];
	[request setPredicate:predicate];
	NSError *error;
	
	NSArray *produtos = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
	return [produtos firstObject];
}

+(NSArray *) produtosComNome:(NSString *)nome {
    
    AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nome CONTAINS[cd] %@", nome];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Produtos"];
    [request setPredicate:predicate];
    NSError *error;
    
    NSArray *produtos = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
    return produtos;
}


@end
