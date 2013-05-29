//
//  MenuViewController.h
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import "SuperViewController.h"
#import "MenuItemModel.h"
#import "MenuItemView.h"
#import "LayoutView.h"


@interface MenuViewController : SuperViewController <MenuItemViewDelegate>

@property (nonatomic, retain) MenuItemModel             *itemModel;

@property (nonatomic, retain) IBOutlet UIView           *quickMenuContainerView;
@property (nonatomic, retain) IBOutlet UIScrollView     *rootMenuContainerScroll;

@property (nonatomic, retain) IBOutlet UIPageControl    *pageControl;

@property (nonatomic, retain) IBOutlet UIButton         *tabBtn1;
@property (nonatomic, retain) IBOutlet UIButton         *tabBtn2;
@property (nonatomic, retain) IBOutlet UIButton         *tabBtn3;

@property (nonatomic, readonly) CGFloat                 topOffset;

- (void)selectModel:(MenuItemModel *)model;
- (MenuItemModel *)getModelWithName:(NSString *)name;


@end
