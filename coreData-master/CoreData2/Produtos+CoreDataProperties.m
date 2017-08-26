//
//  Produtos+CoreDataProperties.m
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "Produtos+CoreDataProperties.h"

@implementation Produtos (CoreDataProperties)

+ (NSFetchRequest<Produtos *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Produtos"];
}

@dynamic marca;
@dynamic nome;
@dynamic quantidade;
@dynamic fotos;

@end
