//
//  AppDelegate.h
//  ProjectAnimation2
//
//  Created by Siddhartha Freitas on 12/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MSSlidingPanelController.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MSSlidingPanelController *slidingPanelController;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

