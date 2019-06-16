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


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray *urlArray;
@property(strong, nonatomic) NSMutableArray *tableDataModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableDataModel = [NSMutableArray array];
    self.navigationItem.title = @"Main";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"imageID"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview: self.tableView];
    self.navigationController.navigationBar.layer.borderColor = [UIColor colorWithRed:0xE6/255.0f
                                                                                green:0xE6/255.0f
                                                                                 blue:0xE6/255.0f alpha:1].CGColor;
    
self.urlArray = @[@"http://www.designerspics.com/wp-content/uploads/2014/06/laptop_headphone_free_photo1.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/07/fallen_leaves_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/06/shirts_free_photos.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/11/gifts_golder_wrapper_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/07/escalator_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/10/to_do_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/05/united_states_capitol_large_free_photo.jpg", @"http://www.designerspics.com/wp-content/uploads/2014/11/notebook_pen_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/07/pizza_free_photo.jpg", @"http://www.designerspics.com/wp-content/uploads/2014/12/xmas_decoration_2_free_photo.jpg",@"https://images.freeimages.com/images/large-previews/adf/sun-burst-1478549.jpg",@"https://images.freeimages.com/images/large-previews/7e9/ladybird-1367182.jpg",@"https://images.freeimages.com/images/large-previews/23a/three-gondoliers-and-a-duck-1391336.jpg",@"https://images.freeimages.com/images/large-previews/05e/on-the-road-6-1384796.jpg",@"https://images.freeimages.com/images/large-previews/8b0/bed-post-1530404.jpg",@"https://images.freeimages.com/images/large-previews/d2f/bluebells-2007-1374105.jpg",@"https://images.freeimages.com/images/large-previews/72c/fox-1522156.jpg",@"https://images.freeimages.com/images/large-previews/b3d/flowers-1375316.jpg",@"https://images.freeimages.com/images/large-previews/b10/can-t-look-over-1312680.jpg",@"https://images.freeimages.com/images/large-previews/977/beach-1364350.jpg",@"https://images.freeimages.com/images/large-previews/411/light-of-technology-1510575.jpg",@"https://images.freeimages.com/images/large-previews/c45/old-technology-1530561.jpg",@"https://images.freeimages.com/images/large-previews/473/inside-flawed-technology-1450422.jpg", @"https://images.freeimages.com/images/large-previews/cda/technology-2-1464895.jpg",@"https://images.freeimages.com/images/large-previews/058/fujitsu-building-2-1233651.jpg", @"https://images.freeimages.com/images/large-previews/1ff/office-buildings-2-1218472.jpg",@"https://images.freeimages.com/images/large-previews/00f/buildings-1234010.jpg", @"https://images.freeimages.com/images/large-previews/25d/building-1524401.jpg",@"https://images.freeimages.com/images/large-previews/ac8/cmy-k-1427305.jpg", @"https://images.freeimages.com/images/large-previews/168/color-drop-1175815.jpg"];
    

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
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSOperation *lastOperation = nil;
    
    for (int index = 0; index < self.urlArray.count; index++) {
        NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            
            NSURL * url = [NSURL URLWithString:self.urlArray[index]];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            
            NSOperation *finalOperation = [NSBlockOperation blockOperationWithBlock:^{
            NSMutableDictionary *imageInfo = self.tableDataModel[index];
                
               [imageInfo setDictionary:@{
                                           @"url": data ,
                                           @"image": image,
                                           }];
                
                [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
            }];
            
            [mainQueue addOperation:finalOperation];
        }];
        
        if (lastOperation) {
            [operation addDependency:lastOperation];
        }
        
        lastOperation = operation;
        
        [myQueue addOperation:operation];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.urlArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"imageID" forIndexPath:indexPath];
   
    NSDictionary *imageInfo = self.tableDataModel[indexPath.row];
    NSString *downloadImage = self.urlArray[indexPath.row];
    UIImage *image = [imageInfo objectForKey:@"image"];
    
    if (image) {
        cell.myImageView.image = [imageInfo objectForKey:@"image"];
        cell.urlLabel.text = downloadImage;
        cell.myImageView.contentMode = UIViewContentModeScaleAspectFit;
    }

   cell.layer.masksToBounds = YES;
   [cell.urlLabel sizeToFit];
  
    return cell;
}

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
