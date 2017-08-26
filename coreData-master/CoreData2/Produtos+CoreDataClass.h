//
//  Produtos+CoreDataClass.h
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Fotos;

NS_ASSUME_NONNULL_BEGIN

@interface Produtos : NSManagedObject

- (void) fillWithAttributes: (NSDictionary *) attributes;
+(Produtos *)novoProduto:(NSDictionary *)elements;
+(NSArray *) todosProdutos;
+(Produtos *) produtoComNome:(NSString *)nome ;

+(NSArray *) produtosComNome:(NSString *)nome;

@end

NS_ASSUME_NONNULL_END

#import "Produtos+CoreDataProperties.h"
