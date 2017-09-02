//
//  Fotos+CoreDataClass.h
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Produtos;

NS_ASSUME_NONNULL_BEGIN

@interface Fotos : NSManagedObject

+(Fotos *)novaFoto:(NSDictionary *)elements;

@end

NS_ASSUME_NONNULL_END

#import "Fotos+CoreDataProperties.h"
