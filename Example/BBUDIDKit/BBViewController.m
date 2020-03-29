//
//  BBViewController.m
//  BBUDIDKit
//
//  Created by humin on 03/29/2020.
//  Copyright (c) 2020 humin. All rights reserved.
//

#import "BBViewController.h"
#import <BBUDIDKit/BBUDIDKit.h>

#define kSectionTitleKey    @"SectionTitle"
#define kCellTitleArrayKey      @"CellTitleArray"
#define kCellTitleKey   @"Title"
#define kCellOperationKey @"Operation"

@interface BBViewController ()

@property (nonatomic, retain) NSMutableArray *sections;

@end

@implementation BBViewController

- (void)idfa
{
    NSString *idfa = BB_GENERATE_IDFA;
    NSString *openid = BB_GENERATE_OPENID;
    NSLog(@"idfa = %@", idfa);
    NSLog(@"openid = %@", openid);
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.sections = [NSMutableArray array];
    {
        NSMutableArray *array = [NSMutableArray array];
        __weak typeof(self) weakSelf = self;
        [array addObject:@{kCellTitleKey: @"IDFA", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
            [weakSelf idfa];
        }]}];
        
        [self.sections addObject:@{kSectionTitleKey: @"测试",
                                   kCellTitleArrayKey: array}];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#if 1
#warning 测试
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        if (indexPath.section < [self numberOfSectionsInTableView:self.tableView]
            && indexPath.row < [self tableView:self.tableView numberOfRowsInSection:indexPath.section]) {
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
            [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
        }
#endif
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dict = [self.sections objectAtIndex:section];
    if ([dict isKindOfClass:[NSDictionary class]]) {
        return dict[kSectionTitleKey];
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = [self.sections objectAtIndex:section];
    if ([dict isKindOfClass:[NSDictionary class]]) {
        return [dict[kCellTitleArrayKey] count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCellIDentifier" forIndexPath:indexPath];
    
    NSDictionary *dict = [self.sections objectAtIndex:indexPath.section];
    NSArray *titles = dict[kCellTitleArrayKey];
    if ([titles isKindOfClass:[NSArray class]]) {
        NSDictionary *cellDict = titles[indexPath.row];
        if ([dict isKindOfClass:[NSDictionary class]]) {
            cell.textLabel.text = [NSString stringWithFormat:@"%zd-%zd %@", indexPath.section, indexPath.row, cellDict[kCellTitleKey]];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dict = [self.sections objectAtIndex:indexPath.section];
    NSArray *titles = dict[kCellTitleArrayKey];
    if ([titles isKindOfClass:[NSArray class]]) {
        NSDictionary *cellDict = titles[indexPath.row];
        if ([dict isKindOfClass:[NSDictionary class]]) {
            NSBlockOperation *operation = cellDict[kCellOperationKey];
            for (void (^block)(void)  in operation.executionBlocks) {
                block();
            }
        }
    }
}

@end
