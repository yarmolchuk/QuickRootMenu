//
//  MenuItemModel.h
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItemModel : NSObject

@property (nonatomic, retain)	NSString	*viewControllerClassName;
@property (nonatomic, readonly) Class		viewControllerClass;
@property (nonatomic, retain)	NSString	*title;
@property (nonatomic, readonly)	UIImage		*icon;

@property (nonatomic, retain)	NSArray		*quickMenu;
@property (nonatomic, retain)	NSArray		*rootMenu;
@property (nonatomic, retain)	NSArray		*subitems;

@property (nonatomic, retain)	NSNumber	*ordinal;

@property (nonatomic, retain)	NSNumber	*hidden;
@property (nonatomic, retain)	NSNumber	*scaleFactor;

@property (nonatomic, readonly)	NSArray		*arrSubitems;
@property (nonatomic, readonly)	NSArray		*rootSubitems;


- (id)initWithDictionary:(NSDictionary *)dicPlist;

@end
