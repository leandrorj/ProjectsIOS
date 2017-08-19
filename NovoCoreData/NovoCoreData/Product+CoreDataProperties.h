//
//  Product+CoreDataProperties.h
//  NovoCoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "Product+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Product (CoreDataProperties)

+ (NSFetchRequest<Product *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *brand;
@property (nonatomic) int64_t quantity;
@property (nullable, nonatomic, retain) NSSet<Picture *> *pictures;
@property (nullable, nonatomic, retain) NSManagedObject *relationship;
@property (nullable, nonatomic, retain) NSManagedObject *relationship1;

@end

@interface Product (CoreDataGeneratedAccessors)

- (void)addPicturesObject:(Picture *)value;
- (void)removePicturesObject:(Picture *)value;
- (void)addPictures:(NSSet<Picture *> *)values;
- (void)removePictures:(NSSet<Picture *> *)values;

@end

NS_ASSUME_NONNULL_END
