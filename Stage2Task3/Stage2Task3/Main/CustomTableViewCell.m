//
//  CustomTableViewCell.m
//  Stage2Task3
//
//  Created by Tatyana Shut on 16.06.2019.
//  Copyright © 2019 Tatyana Shut. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell()

@end
@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.urlLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.urlLabel.textColor = [UIColor blackColor];
        self.urlLabel.numberOfLines = 0;
       
        [self.contentView addSubview:self.urlLabel];
        
        self.myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noPhoto"]];
        self.urlLabel.text = @"NO description";
        [self.contentView addSubview:self.myImageView];
        [self addConstraint];
        [self.myImageView setUserInteractionEnabled:YES];
        UIView *view =[[UIView alloc]init];
        view.backgroundColor = [UIColor colorWithRed:0xFE/255.0f
                                               green:0xF6/255.0f
                                                blue:0xE6/255.0f alpha:1];
        self.selectedBackgroundView = view;
    }
    return self;
}

-(void)addConstraint {
    self.myImageView.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *widthImage = [NSLayoutConstraint constraintWithItem:self.myImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute  multiplier:1 constant:110];

    NSLayoutConstraint *heightImage = [NSLayoutConstraint constraintWithItem:self.myImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute  multiplier:1 constant:110];

    NSLayoutConstraint *centerImage = [NSLayoutConstraint constraintWithItem:self.myImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];

 NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.myImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:16];

    [self.contentView addConstraint:left];
    [self.contentView addConstraint:widthImage];
    [self.contentView addConstraint:heightImage];
    [self.contentView addConstraint:centerImage];

    self.urlLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.urlLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.urlLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-40];
    NSLayoutConstraint *distance = [NSLayoutConstraint constraintWithItem:self.myImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.urlLabel attribute:NSLayoutAttributeLeading multiplier:1 constant:-10];

    [self.contentView addConstraint:top];
    [self.contentView addConstraint:trailing];
    [self.contentView addConstraint:distance];
}


@end
