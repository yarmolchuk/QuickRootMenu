//
//  LayoutView.h
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LayoutViewDelegate;

@interface LayoutView : UIView

@property (nonatomic, assign) id <LayoutViewDelegate> delegate;

@end

@protocol LayoutViewDelegate <NSObject>
@required
- (void)layoutViewDidLayout:(LayoutView *)layoutView;
@end
