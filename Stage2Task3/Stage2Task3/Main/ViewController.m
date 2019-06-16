//
//  ViewController.m
//  Stage2Task3
//
//  Created by Tatyana Shut on 16.06.2019.
//  Copyright © 2019 Tatyana Shut. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "DetailsViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Main";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"imageID"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview: self.tableView];
    self.navigationController.navigationBar.layer.borderColor = [UIColor colorWithRed:0xE6/255.0f
                                                                                green:0xE6/255.0f
                                                                                 blue:0xE6/255.0f alpha:1].CGColor;

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"imageID" forIndexPath:indexPath];
   
   cell.indexCell = indexPath.row;
   
   cell.delegate = self;
   cell.layer.masksToBounds = YES;
 
  
    return cell;
}
-(void )showInfoControllerWithContact
{

}

@end
