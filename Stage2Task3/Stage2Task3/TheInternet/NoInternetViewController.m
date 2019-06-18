//
//  NoInternetViewController.m
//  Stage2Task3
//
//  Created by Tatyana Shut on 18.06.2019.
//  Copyright © 2019 Tatyana Shut. All rights reserved.
//

#import "NoInternetViewController.h"

@interface NoInternetViewController ()

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation NoInternetViewController

- (BOOL)hasInternet {
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.google.com"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5.0];
    BOOL connectedToInternet = NO;
    if ([NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil]) {
        connectedToInternet = YES;
    }
    if (!connectedToInternet)
        
    {
        self.tableView.hidden = YES;
        self.view.backgroundColor = [UIColor grayColor];
        UILabel *warningLabel = [UILabel new];
        [self styleLable:warningLabel];
        [self.view addSubview:warningLabel];
        warningLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [warningLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50],
                                                  [warningLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-50],
                                                  [warningLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
                                                  ]];
    }
    
    return connectedToInternet;
}

- (void)styleLable:(UILabel *)label {
    
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    label.text = @"Internet is missing!\n \n Check the connection and restart the application.";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    
}
@end

