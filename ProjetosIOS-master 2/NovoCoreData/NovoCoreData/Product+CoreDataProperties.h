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
@property (nullable, nonatomic, copy) NSNumber *quantity;
@property (nullable, nonatomic, retain) NSSet<Picture *> *picture;

@end

@interface Product (CoreDataGeneratedAccessors)

- (void)addPictureObject:(Picture *)value;
- (void)removePictureObject:(Picture *)value;
- (void)addPicture:(NSSet<Picture *> *)values;
- (void)removePicture:(NSSet<Picture *> *)values;

@end

NS_ASSUME_NONNULL_END
