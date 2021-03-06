//
//  AppDelegate.h
//  ios
//
//  Created by 余鹏 on 15/10/9.
//  Copyright © 2015年 penneryu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "RongIMKit/RongIMKit.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, RCIMConnectionStatusDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

