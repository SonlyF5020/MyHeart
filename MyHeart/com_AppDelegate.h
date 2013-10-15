//
//  com_AppDelegate.h
//  MyHeart
//
//  Created by twer on 9/25/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface com_AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic) UIWindow *window;

@property (readwrite, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readwrite, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readwrite, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)insertObject:(id)obj inListAtIndex:(NSUInteger)theIndex ;

- (void)removeObjectFromListAtIndex:(NSUInteger)theIndex;

-(NSMutableArray *)getDataList;

- (NSUInteger)countOfList;

@end
