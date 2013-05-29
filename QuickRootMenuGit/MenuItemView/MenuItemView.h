//
//  MenuItemView.h
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import "MenuItemModel.h"

@protocol MenuItemViewDelegate;

@interface MenuItemView : UIView

@property (nonatomic, retain) MenuItemModel             *itemModel;

@property (nonatomic, assign) IBOutlet	UIButton        *button;
@property (nonatomic, assign) IBOutlet	UILabel         *labTitle;
@property (nonatomic, assign) IBOutlet	UIImageView     *imgvIcon;

@property (nonatomic, assign) id <MenuItemViewDelegate> delegate;

+ (id)menuItemView;
+ (id)menuItemViewWithModel:(MenuItemModel *)model;

- (IBAction)actSelect:(id)sender;


@end

@protocol MenuItemViewDelegate <NSObject>

@required
- (void)menuItemView:(MenuItemView *)menuItemView didSelectModel:(MenuItemModel *)model;
@end
