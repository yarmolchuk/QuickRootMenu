//
//  SuperViewController.h
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperViewController : UIViewController

@property (nonatomic, assign) UIViewController	*homeViewController;
@property (nonatomic, readonly) BOOL isKeyboardOnscreen;

+ (id)controller;

@end


@protocol SuperViewController <NSObject>
+ (UIViewController *)controller;
@end
