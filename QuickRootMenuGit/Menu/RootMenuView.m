//
//  RootMenuView.m
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import "RootMenuView.h"
#import "MenuItemModel.h"
#import "MenuViewController.h"


@interface RootMenuView ()

@property (nonatomic, retain) NSArray *arrMenuItems;

@end

@implementation RootMenuView

- (void)applyModels
{
    NSMutableArray *arrRootMenuViews = [NSMutableArray array];
    
	for (MenuItemModel *model in self.arrRootMenuItems)
    {
		MenuItemView *menuItemView = [MenuItemView menuItemViewWithModel:model];
		menuItemView.delegate = self;
		[self addSubview:menuItemView];
		[arrRootMenuViews addObject:menuItemView];
	}
	self.arrMenuItems = arrRootMenuViews;
}

- (void)layoutSubviews
{
	const CGRect frame = self.bounds;
    
    for (int i = 0; i < self.arrMenuItems.count; i++) {
        
        MenuItemView *menuItemView = [self.arrMenuItems objectAtIndex:i];
        
        CGRect itemFrame = menuItemView.frame;
		CGFloat dw = frame.size.width - 3.0 * itemFrame.size.width;
        CGFloat dh = frame.size.height - 2.0 * itemFrame.size.height;
        
		dw /= 4.0;
        dh /= 3.0;
        
        if (i > 2) {
            itemFrame.origin.x = (i-3)*(dw + itemFrame.size.width);
            dh = dh * 2 + itemFrame.size.height;
        }
        else {
            itemFrame.origin.x = i*(dw + itemFrame.size.width);
        }
        
		itemFrame.origin.y = dh;
		menuItemView.frame = itemFrame;
    }
}

- (void)menuItemView:(MenuItemView *)menuItemView didSelectModel:(MenuItemModel *)model
{
	[self.delegate menuItemView:menuItemView didSelectModel:model];
}

@end
