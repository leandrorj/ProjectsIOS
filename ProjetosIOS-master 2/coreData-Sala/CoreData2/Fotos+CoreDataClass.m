//
//  Fotos+CoreDataClass.m
//  CoreData2
//
//  Created by Siddhartha Freitas on 18/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import "Fotos+CoreDataClass.h"
#import "Produtos+CoreDataClass.h"
#import "AppDelegate.h"

@implementation Fotos

- (void) fillWithAttributes: (NSDictionary *) attributes {
	id t;
	
	t = [attributes valueForKeyPath:@"imagem"];
	if (t != nil && ![t isKindOfClass:[NSNull class]])
		self.imagem = UIImageJPEGRepresentation((UIImage *)t, 1.0);
	
	t = [attributes valueForKeyPath:@"produto"];
	if (t != nil && ![t isKindOfClass:[NSNull class]])
		self.produto = t;
	
	self.data = [NSDate date];
	
	self.extension = @"jpeg";
	
}


+(Fotos *)novaFoto:(NSDictionary *)elements{
	AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
	Fotos *foto = [NSEntityDescription
					  insertNewObjectForEntityForName:@"Fotos"
					  inManagedObjectContext:appDelegate.persistentContainer.viewContext];
	[foto fillWithAttributes:elements];
	
	NSError *saveError = nil;
	[appDelegate.persistentContainer.viewContext save:&saveError];
	return foto;
}

@end
