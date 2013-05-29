//
//  TableMenuViewController.m
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import "TableMenuViewController.h"
#import "MenuItemModel.h"

@interface TableMenuViewController ()

@end

@implementation TableMenuViewController

@dynamic itemModel;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.itemModel.arrSubitems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	const NSUInteger row = indexPath.row;
	static NSString *cellID = @"cellID";
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
	
    if (! cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:16];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	MenuItemModel *model = [self.itemModel.arrSubitems objectAtIndex:row];
	cell.textLabel.text = model.title;
	cell.imageView.image = model.icon;
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
	MenuItemModel *model = [self.itemModel.arrSubitems objectAtIndex:indexPath.row];
	[super selectModel:model];
}

- (void)applyModels
{}

- (void)layoutSubviews
{}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
