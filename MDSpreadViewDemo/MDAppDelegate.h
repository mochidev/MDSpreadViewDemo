//
//  MDAppDelegate.h
//  MDSpreadViewDemo
//
//  Created by Dimitri Bouniol on 10/15/11.
//  Copyright (c) 2011 Mochi Development Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDViewController;

@interface MDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MDViewController *viewController;

@end
