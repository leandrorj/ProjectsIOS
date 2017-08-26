//
//  Fotos+CoreDataProperties.h
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "Fotos+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Fotos (CoreDataProperties)

+ (NSFetchRequest<Fotos *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *imagem;
@property (nullable, nonatomic, copy) NSDate *data;
@property (nullable, nonatomic, copy) NSString *extension;
@property (nullable, nonatomic, retain) Produtos *produto;

@end

NS_ASSUME_NONNULL_END
