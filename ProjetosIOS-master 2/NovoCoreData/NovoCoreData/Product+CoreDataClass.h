//
//  Product+CoreDataClass.h
//  NovoCoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Treinamento. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Picture;

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSManagedObject

+(Product *)novoProduto:(NSDictionary *)elements;

+(NSArray *) todosProdutos;





@end

NS_ASSUME_NONNULL_END

#import "Product+CoreDataProperties.h"

