//
//  ViewController.m
//  TestBlockedMainthread
//
//  Created by Marek Moscichowski on 14.01.2015.
//  Copyright (c) 2015 Miquido. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = @[@"Raz", @"Dwa", @"Trzy"];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(action)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)action {
    for(int i = 0; i < 10000;i++){
        NSLog(@"hehe");
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = self.model[(NSUInteger) indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = [UIViewController new];
    viewController.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
