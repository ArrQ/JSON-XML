//
//  AppDelegate.h
//  XML+JSON
//
//  Created by ArrQ on 2017/10/15.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

