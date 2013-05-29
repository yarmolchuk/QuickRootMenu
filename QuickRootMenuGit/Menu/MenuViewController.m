//
//  MenuViewController.m
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuItemView.h"
#import "MenuItemModel.h"
#import "RootMenuView.h"

@interface MenuViewController ()

@property (nonatomic, retain) NSArray *allMenuItems;

@end

@implementation MenuViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	self.title = self.itemModel.title;
    
	if (self.allMenuItems.count == 0)
    {
		[self applyModels];
        [self applyRootModels];
	}
	[self layoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    
	[UIView animateWithDuration:animated ? 0.2 : -1 animations:^{
		[self layoutSubviews];
	}];
    
    [self layoutSubviews];
}

- (void)applyRootModels
{
    NSRange theRange;
	int countView = (self.itemModel.rootMenu.count / 6);
    
    if (self.itemModel.rootSubitems.count % 6 != 0) {
        countView++;
    }
    
    self.pageControl.numberOfPages = countView;
    
    CGRect sizeRootScroll = self.rootMenuContainerScroll.bounds;
    self.rootMenuContainerScroll.contentSize = CGSizeMake(320 * countView, sizeRootScroll.size.height);
    
    for (int i = 0; i < countView; i++) {
        RootMenuView *rootView = [[RootMenuView alloc] initWithFrame:CGRectMake(i*320, 0, sizeRootScroll.size.width, sizeRootScroll.size.height)];
        rootView.delegate = self;
        
        theRange.location = i * 6;
        
        if ((i + 1) * 6 > self.itemModel.rootSubitems.count) {
            theRange.length = self.itemModel.rootSubitems.count - (i * 6);
        } else {
            theRange.length = 6;
        }
        
        rootView.arrRootMenuItems = [self.itemModel.rootSubitems subarrayWithRange:theRange];
        [self.rootMenuContainerScroll addSubview:rootView];
        
        [rootView applyModels];
        [rootView layoutSubviews];
    }
}

- (void)applyModels
{
	[self.allMenuItems makeObjectsPerformSelector:@selector(removeFromSuperview)];
	
	UIView *areaView = self.quickMenuContainerView ? self.quickMenuContainerView : self.view;
	NSMutableArray *arrMenuViews = [NSMutableArray arrayWithCapacity:16];
    
	for (MenuItemModel *model in self.itemModel.arrSubitems)
    {
		MenuItemView *menuItemView = [MenuItemView menuItemViewWithModel:model];
		menuItemView.delegate = self;
		[areaView addSubview:menuItemView];
		[arrMenuViews addObject:menuItemView];
	}
	self.allMenuItems = arrMenuViews;
}

#pragma mark - Actions

- (IBAction)QRSetInvoice:(id)sender
{
//    QRSetInvoiceVC *qrController = [QRSetInvoiceVC controller];
//    [self.navigationController pushViewController:qrController animated:YES];
}

#pragma mark - ZMenuItemViewDelegate

- (void)menuItemView:(MenuItemView *)menuItemView didSelectModel:(MenuItemModel *)model
{
	[self selectModel:model];
}

- (void)selectModel:(MenuItemModel *)model
{
	SuperViewController *ctr = [model.viewControllerClass new];
    
	if ([ctr isKindOfClass:[MenuViewController class]]) {
		MenuViewController *menuCtr = (MenuViewController *)ctr;
		menuCtr.itemModel = model;
        menuCtr.homeViewController = self;
	}
    
	[self.navigationController pushViewController:ctr animated:YES];
}

- (MenuItemModel *)getModelWithName:(NSString *)name
{
    NSArray * result = [self.itemModel.arrSubitems filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"viewControllerClassName == %@", name]];
    
    if (result.count) {
        return [result objectAtIndex:0];
    }
    return nil;
}

- (CGFloat)topOffset
{
	return 8;
}

- (void)layoutSubviews
{
	UIView *areaView = self.quickMenuContainerView;
	const CGRect frame = areaView.bounds;
    
	const CGFloat hOffset = [self topOffset];
	const CGFloat navBarHeight = 0;
    const CGFloat fullHeight = frame.size.height;
	const CGFloat viewHeight = fullHeight - 44 - navBarHeight - hOffset;
	
    if (self.allMenuItems.count == 2)
    {
        MenuItemView* item1 = [self.allMenuItems objectAtIndex:0];
        item1.center = CGPointMake(CGRectGetMidX(frame), viewHeight / 4);
        
        MenuItemView* item2 = [self.allMenuItems objectAtIndex:1];
        item2.center = CGPointMake(CGRectGetMidX(frame), viewHeight * 3 / 4);
        
        return;
    }
    
	for (MenuItemView *menuItemView in self.allMenuItems)
    {
		CGRect itemFrame = menuItemView.frame;
		CGFloat dw = frame.size.width - 3.0 * itemFrame.size.width;
		dw /= 4.0;
        
		const NSUInteger i = [menuItemView.itemModel.ordinal intValue];
		
        itemFrame.origin.x = (i & 1) ? itemFrame.size.width + 3.0 * dw : dw;
        itemFrame.origin.x = i*(dw + itemFrame.size.width);
        
		itemFrame.origin.y = hOffset + (frame.size.height - itemFrame.size.height)/2;
        
		menuItemView.frame = itemFrame;
	}
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = self.rootMenuContainerScroll.frame.size.width;
    int page = floor((self.rootMenuContainerScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
