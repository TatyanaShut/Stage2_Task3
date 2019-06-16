//
//  DetailsViewController.m
//  Stage2Task3
//
//  Created by Tatyana Shut on 16.06.2019.
//  Copyright © 2019 Tatyana Shut. All rights reserved.
//

#import "DetailsViewController.h"
@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Details";
     UIView * customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    customView.backgroundColor = [UIColor colorWithRed:0xFE/255.0f
                                                 green:0xF6/255.0f
                                                  blue:0xE6/255.0f alpha:1];
    [self.view addSubview:customView];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;

    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.imageFull];
    [customView addSubview:imageView];
    
    
  
    
    if(imageView.frame.size.width > self.view.frame.size.width ||  imageView.frame.size.height > self.view.frame.size.height) {

        imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, imageView.frame.size.height);
        imageView.center = imageView.superview.center;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    else{
        
        imageView.center = imageView.superview.center;
    }
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backButtonnImage = [UIImage imageNamed:@"arrow_left"];
    [backButton setBackgroundImage:backButtonnImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton] ;
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
}

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
