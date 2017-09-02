//
//  Produtos+CoreDataProperties.h
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "Produtos+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Produtos (CoreDataProperties)

+ (NSFetchRequest<Produtos *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *marca;
@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSNumber *quantidade;
@property (nullable, nonatomic, retain) NSSet<Fotos *> *fotos;

@end

@interface Produtos (CoreDataGeneratedAccessors)

- (void)addFotosObject:(Fotos *)value;
- (void)removeFotosObject:(Fotos *)value;
- (void)addFotos:(NSSet<Fotos *> *)values;
- (void)removeFotos:(NSSet<Fotos *> *)values;

@end

NS_ASSUME_NONNULL_END
