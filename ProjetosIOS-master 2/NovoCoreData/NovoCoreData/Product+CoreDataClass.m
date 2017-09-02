//
//  Product+CoreDataClass.m
//  NovoCoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "Product+CoreDataClass.h"
#import "Picture+CoreDataClass.h"
#import "AppDelegate.h"

@implementation Product


- (void) fillWithAttributes: (NSDictionary *) attributes {
    id t;
    
    t = [attributes valueForKeyPath:@"Nome"];
    if (t != nil && ![t isKindOfClass:[NSNull class]])
        self.name = [t description];
    
    t = [attributes valueForKeyPath:@"Marca"];
    if (t != nil && ![t isKindOfClass:[NSNull class]])
        self.brand = [t description];
    
    t = [attributes valueForKeyPath:@"Quantidade"];
    if (t != nil && ![t isKindOfClass:[NSNull class]])
        self.quantity = @([t integerValue]);
    
}


+(Product *)novoProduto:(NSDictionary *)elements{
    AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
    Product *prod = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Product"
                      inManagedObjectContext:appDelegate.persistentContainer.viewContext];
    [prod fillWithAttributes:elements];
    
    NSError *saveError = nil;
    [appDelegate.persistentContainer.viewContext save:&saveError];
    return prod;
}

+(NSArray *) todosProdutos {
    
    AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Product"];
    NSError *error;
    NSArray *produtos = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&error];
    return produtos ;
}

@end
