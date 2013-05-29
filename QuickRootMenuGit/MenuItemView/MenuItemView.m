//
//  MenuItemView.m
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import "MenuItemView.h"
#import "MenuItemModel.h"

@interface MenuItemView ()

- (void)applyModel:(MenuItemModel *)model;

@end

@implementation MenuItemView


+ (id)menuItemView {
	MenuItemView *menuItemView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
	return menuItemView;
}

+ (id)menuItemViewWithModel:(MenuItemModel *)model {
	MenuItemView *menuItemView = [self menuItemView];
	[menuItemView applyModel:model];
	return menuItemView;
}

- (MenuItemModel *)model {
	return self.itemModel;
}

- (void)applyModel:(MenuItemModel *)model {
	self.itemModel = model;
    
	self.labTitle.text = self.itemModel.title;
	self.imgvIcon.image = self.itemModel.icon;
    
	if ([self.itemModel.hidden boolValue]) {
		self.alpha =  0.5;
		self.userInteractionEnabled = NO;
		self.labTitle.hidden = YES;
	}
	else {
		self.labTitle.hidden = NO;
	}
	
	if (self.itemModel.scaleFactor) {
		const CGFloat scale = [self.itemModel.scaleFactor floatValue];
		self.transform = CGAffineTransformMakeScale(scale, scale);
	}
	else {
		self.transform = CGAffineTransformIdentity;
	}
}

- (IBAction)actSelect:(id)sender {
	if ([self.delegate respondsToSelector:@selector(menuItemView:didSelectModel:)]) {
		[self.delegate menuItemView:self didSelectModel:self.itemModel];
	}
}

@end
