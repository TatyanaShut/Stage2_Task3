//
//  CustomTableViewCell.m
//  Stage2Task3
//
//  Created by Tatyana Shut on 16.06.2019.
//  Copyright © 2019 Tatyana Shut. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.urlLabel = [[UILabel alloc] init];
        [self styleLabel:self.urlLabel];
        
        self.imageFromUrlView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noPhoto"]];
        [self styleImageView:self.imageFromUrlView];
        
        [self addConsctraint];
  }
    
    return self;
}
- (void)styleLabel:(UILabel *)label {
    
    label.text = @"NO description";
    label.numberOfLines = 0;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:label];
}

- (void)styleImageView:(UIImageView *)imageView {
  
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView setUserInteractionEnabled:YES];
    [self addSubview:imageView];
}

- (void)addConsctraint {
    
    [NSLayoutConstraint activateConstraints:
     @[
       [self.imageFromUrlView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
       [self.imageFromUrlView.heightAnchor constraintEqualToConstant:110.f],
       [self.imageFromUrlView.widthAnchor constraintEqualToConstant:110.f],
       [self.imageFromUrlView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:20.f],
       
       [self.urlLabel.leadingAnchor constraintEqualToAnchor:self.imageFromUrlView.trailingAnchor constant:20.f],
       [self.urlLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant: -17.f],
       [self.bottomAnchor constraintEqualToAnchor:self.urlLabel.bottomAnchor constant:40],
       [self.topAnchor constraintEqualToAnchor:self.urlLabel.topAnchor constant:-40]
       ]];
    
}

@end
