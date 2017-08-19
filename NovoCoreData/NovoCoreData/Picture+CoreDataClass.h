//
//  Picture+CoreDataClass.h
//  NovoCoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

NS_ASSUME_NONNULL_BEGIN

@interface Picture : NSManagedObject

+(Product *)newProduct:(NSDictionary *)elements;
+(NSArray *) allProduct;

@end

NS_ASSUME_NONNULL_END

#import "Picture+CoreDataProperties.h"
