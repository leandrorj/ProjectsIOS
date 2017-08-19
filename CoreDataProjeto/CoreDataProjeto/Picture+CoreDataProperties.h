//
//  Picture+CoreDataProperties.h
//  CoreDataProjeto
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import "Picture+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Picture (CoreDataProperties)

+ (NSFetchRequest<Picture *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *data;
@property (nullable, nonatomic, retain) NSData *date;
@property (nullable, nonatomic, copy) NSString *extensign;
@property (nullable, nonatomic, retain) Product *product;

@end

NS_ASSUME_NONNULL_END
