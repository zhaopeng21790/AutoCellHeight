//
//  ViewController.m
//  AutoCellHeightDemo
//
//  Created by 赵朋 on 16/7/25.
//  Copyright © 2016年 赵朋. All rights reserved.
//

#import "ViewController.h"
#import "FeedCell.h"
#import <UITableView+FDTemplateLayoutCell.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

/*  */
@property (nonatomic, strong) UITableView *tableView;
/*  */
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArray = [NSMutableArray arrayWithCapacity:30];
    
   
    // Data from `data.json`
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feedDicts = rootDict[@"feed"];
    
    [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self.dataArray addObject:[[FeedEntity alloc] initWithDictionary:obj]];
    }];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [_tableView registerClass:[FeedCell class] forCellReuseIdentifier:@"FDFeedCell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FDFeedCell"];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(FeedCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = YES; // Enable to use "-sizeThatFits:"
    cell.entity = [self.dataArray objectAtIndex:indexPath.row];
    
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    FeedEntity *entity = [self.dataArray objectAtIndex:indexPath.row];
    
    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"FDFeedCell" cacheByIndexPath:indexPath configuration:^(FeedCell *cell) {
        
        [self configureCell:cell atIndexPath:indexPath];
        
    }];
    
    
    NSLog(@"%f", height);
    
    return height;
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
