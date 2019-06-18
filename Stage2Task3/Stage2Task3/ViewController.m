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
#import "DataSource.h"

NSString *const cellReuseIdentifier = @"imageID";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray *urlArray;
@property(strong, nonatomic) NSMutableArray *tableDataModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
    self.tableDataModel = [NSMutableArray array];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview: self.tableView];
    
    self.navigationItem.title = @"Main";

    self.urlArray = [[DataSource alloc]init].urlArray;
    
    CustomTableViewCell *cell = [[CustomTableViewCell alloc]init];
    for (int index = 0; index < self.urlArray.count; index++) {
        NSMutableDictionary *imageInfo = [@{
                                            @"defaultImage": [UIImage imageNamed:@"noPhoto"],
                                            @"defaultText": cell.urlLabel.text
                                            } mutableCopy];
        
        [self.tableDataModel addObject:imageInfo];
    }
    
    [self operationQueue];
    
}

- (void)operationQueue {
    
    NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
    for (NSInteger index = 0; index < self.urlArray.count; index++) {
        [myQueue addOperationWithBlock:^{
            
            NSURL *url = [NSURL URLWithString:self.urlArray[index]];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            NSMutableDictionary *imageInfo = self.tableDataModel[index];
            
            [imageInfo setDictionary:@{
                                       @"url": data ,
                                       @"image": image,
                                       }];
            
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        });
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.urlArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    NSDictionary *imageInfo = self.tableDataModel[indexPath.row];
    UIImage *image = [imageInfo objectForKey:@"image"];
    
    if (image) {
        cell.imageFromUrlView.image = [imageInfo objectForKey:@"image"];
        cell.urlLabel.text = self.urlArray[indexPath.row];
        cell.imageFromUrlView.contentMode = UIViewContentModeScaleAspectFit;
    }
    else{
        
        cell.imageFromUrlView.image = [imageInfo objectForKey:@"defaultImage"];
        cell.urlLabel.text = [imageInfo objectForKey:@"defaultText"];
    }
    
    return cell;
}
#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSOperationQueue *currentQueue = [NSOperationQueue new];
    [currentQueue setSuspended:YES];
    
    NSDictionary *imageInfo = self.tableDataModel[indexPath.row];
    UIImage *image = [imageInfo objectForKey:@"image"];
    
    if (!image) {
        image = [UIImage imageNamed:@"noPhoto"];
    }
    DetailsViewController *detailsVC = [[DetailsViewController alloc]init];
    detailsVC.imageFull = image;
    [self.navigationController pushViewController:detailsVC animated:YES];
}
@end
