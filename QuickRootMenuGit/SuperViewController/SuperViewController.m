//
//  SuperViewController.m
//  QuickRootMenuGit
//
//  Created by Dima Yarmolchuk on 29.05.13.
//  Copyright (c) 2013 yarmolchuk. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

+ (id)controller
{
    return [[self alloc] init];
}

- (NSString *)nibName
{
    return NSStringFromClass([self class]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
