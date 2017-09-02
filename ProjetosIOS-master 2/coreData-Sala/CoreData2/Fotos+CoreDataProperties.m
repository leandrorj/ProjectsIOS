//
//  Fotos+CoreDataProperties.m
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "Fotos+CoreDataProperties.h"

@implementation Fotos (CoreDataProperties)

+ (NSFetchRequest<Fotos *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Fotos"];
}

@dynamic imagem;
@dynamic data;
@dynamic extension;
@dynamic produto;

@end
