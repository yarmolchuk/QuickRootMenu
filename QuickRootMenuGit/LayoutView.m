//
//  LayoutView.m
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import "LayoutView.h"

@implementation LayoutView

- (void)layoutSubviews {
	[super layoutSubviews];
	if ([self.delegate respondsToSelector:@selector(layoutViewDidLayout:)]) {
		[self.delegate layoutViewDidLayout:self];
	}
}

@end
