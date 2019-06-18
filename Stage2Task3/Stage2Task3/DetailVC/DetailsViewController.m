//
//  DetailsViewController.m
//  Stage2Task3
//
//  Created by Tatyana Shut on 16.06.2019.
//  Copyright © 2019 Tatyana Shut. All rights reserved.
//

#import "DetailsViewController.h"
@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Details";
    
     UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    customView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:customView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.imageFull];
    [customView addSubview:imageView];
    
    [self checkImageSize:imageView];
 
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backButtonnImage = [UIImage imageNamed:@"arrow_left"];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self creatBarButton:backButton :backButtonnImage :backBarButtonItem];
}

- (void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)creatBarButton:(UIButton *)button :(UIImage *)image :(UIBarButtonItem *)buttonItem {
    
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = buttonItem;
}

- (void)checkImageSize:(UIImageView *)imageView {
    
    if(imageView.frame.size.width > self.view.frame.size.width ||  imageView.frame.size.height > self.view.frame.size.height) {
        
        imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, imageView.frame.size.height);
        imageView.center = imageView.superview.center;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    else{
        imageView.center = imageView.superview.center;
    }
}

@end
