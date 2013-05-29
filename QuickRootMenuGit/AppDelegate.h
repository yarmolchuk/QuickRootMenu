//
//  AppDelegate.h
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate, UIWebViewDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *mainMenuNavigationController;

@property (strong, nonatomic) MenuViewController *viewController;

@end
