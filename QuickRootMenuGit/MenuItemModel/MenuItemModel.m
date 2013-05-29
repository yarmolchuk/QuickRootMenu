//
//  MenuItemModel.m
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import "MenuItemModel.h"

@interface MenuItemModel ()

@property (nonatomic, retain)	NSString	*iconName;

@end

@implementation MenuItemModel

- (Class)viewControllerClass {
	return NSClassFromString(self.viewControllerClassName);
}

- (UIImage *)icon {
	return [UIImage imageNamed:self.iconName];
}

- (NSArray *)arrSubitems {
    
    NSArray *items = [NSArray array];
    
    if (self.quickMenu.count) {
        items = self.quickMenu;
    }
    else if(self.subitems.count) {
        items = self.subitems;
    }
    
    NSMutableArray *arrSubitems = [NSMutableArray arrayWithCapacity:[items count]];
    
    for (NSDictionary *plist in items) {
		MenuItemModel *model = [[[self class] alloc] initWithDictionary:plist];
		if (model) {
			[arrSubitems addObject:model];
		}
	}
	return arrSubitems;
}

-(NSArray *)rootSubitems {
    
    NSArray *items = [NSArray array];
    
    if (self.rootMenu.count) {
        items = self.rootMenu;
    }
    
    NSMutableArray *rootSubitem = [NSMutableArray arrayWithCapacity:[items count]];
    
    for (NSDictionary *plist in items) {
		MenuItemModel *model = [[[self class] alloc] initWithDictionary:plist];
		if (model) {
			[rootSubitem addObject:model];
		}
	}
	return rootSubitem;
}

- (id)initWithDictionary:(NSDictionary *)dicPlist {
	
	if ([dicPlist count] == 0) {
		return nil;
	}
	
	if ((self = [super init])) {
		NSArray *propertyNames = [NSArray arrayWithObjects:
								  @"iconName",
								  @"viewControllerClassName",
								  @"title",
								  @"quickMenu",
                                  @"rootMenu",
                                  @"subitems",
								  @"ordinal",
								  nil];
		NSArray *propertyNamesOptional = [NSArray arrayWithObjects:
										  @"hidden",
										  @"scaleFactor",
                                          nil];
        
		NSMutableArray *allProps = [propertyNames mutableCopy];
		[allProps addObjectsFromArray:propertyNamesOptional];
		
		for (NSString *prop in allProps) {
			NSString *val = [dicPlist objectForKey:prop];
			if (val) {
				[self setValue:val forKey:prop];
			}
			else {
				if (![propertyNamesOptional containsObject:prop]) {
				}
			}
		}
	}
	
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@ %p> '%@' '%@'", [self class], self, self.title, self.viewControllerClassName];
}

@end
