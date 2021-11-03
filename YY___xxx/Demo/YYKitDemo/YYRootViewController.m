//
//  YERootViewController.m
//  YYKitExample
//
//  Created by ibireme on 14-10-13.
//  Copyright (c) 2014 ibireme. All rights reserved.
//

#import "YYRootViewController.h"
#import "YYKit.h"

@interface YYRootViewController ()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;

@property (nonatomic, strong) NSMutableArray *titles_x;
@property (nonatomic, strong) NSMutableArray *classNames_x;
@property (nonatomic, strong) NSMutableArray *images_x;

@end

@implementation YYRootViewController

- (void)addCell:(NSString *)title class:(NSString *)className image:(NSString *)imageName {
    [self.titles_x addObject:title];
    [self.classNames_x addObject:className];
    [self.images_x addObject:[YYImage imageNamed:imageName]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YYKit Example";
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    //
    
    
    //
    self.titles_x = @[].mutableCopy;
    self.classNames_x = @[].mutableCopy;
    self.images_x = @[].mutableCopy;

    //
    
    //
    
    
    [self addCell:@"Model" class:@"YYModelExample"];
    [self addCell:@"Image" class:@"YYImageExample"];
    [self addCell:@"Text" class:@"YYTextExample"];

    
    
    //
    
    //
    
    [self addCell:@"Twitter" class:@"T1HomeTimelineItemsViewController" image:@"Twitter.jpg"];
    [self addCell:@"Weibo" class:@"WBStatusTimelineViewController" image:@"Weibo.jpg"];
    
    
    //
    
    //
    
    [self.tableView reloadData];
    
    //[self log];
}

- (void)log {
    printf("all:%.2f MB   used:%.2f MB   free:%.2f MB   active:%.2f MB  inactive:%.2f MB  wird:%.2f MB  purgable:%.2f MB\n",
           [UIDevice currentDevice].memoryTotal / 1024.0 / 1024.0,
           [UIDevice currentDevice].memoryUsed / 1024.0 / 1024.0,
           [UIDevice currentDevice].memoryFree / 1024.0 / 1024.0,
           [UIDevice currentDevice].memoryActive / 1024.0 / 1024.0,
           [UIDevice currentDevice].memoryInactive / 1024.0 / 1024.0,
           [UIDevice currentDevice].memoryWired / 1024.0 / 1024.0,
           [UIDevice currentDevice].memoryPurgable / 1024.0 / 1024.0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self log];
    });
}

- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}




#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger one = _titles.count;
    return one + _titles_x.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < 3){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YY"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YY"];
        }
        cell.textLabel.text = _titles[indexPath.row];
        return cell;
    }
    else{
        NSInteger row = indexPath.row - 3;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YY_"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YY_"];
        }
        cell.textLabel.text = _titles_x[row];
        cell.imageView.image = _images_x[row];
        cell.imageView.clipsToBounds = YES;
        cell.imageView.layer.cornerRadius = 48 / 2;
        return cell;
    }
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSString *className;
    if (row >= 3){
        className = self.classNames_x[row - 3];
    }
    else{
        className = self.classNames[row];
    }
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        if (row >= 3){
            ctrl.title = _titles_x[row - 3];
        }
        else{
            ctrl.title = _titles[row];
        }
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
