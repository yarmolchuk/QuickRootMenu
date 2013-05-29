//
//  RootMenuView.h
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemView.h"

@interface RootMenuView : UIView  <MenuItemViewDelegate>

@property (nonatomic, assign) id <MenuItemViewDelegate> delegate;

@property (nonatomic, retain) NSArray *arrRootMenuItems;

- (void)applyModels;

@end
