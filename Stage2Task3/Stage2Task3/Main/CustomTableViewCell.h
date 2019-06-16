//
//  CustomTableViewCell.h
//  Stage2Task3
//
//  Created by Tatyana Shut on 16.06.2019.
//  Copyright © 2019 Tatyana Shut. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableViewCellDelegate <NSObject>

- (void) showInfoControllerWithContact;

@end

@interface CustomTableViewCell : UITableViewCell
@property (nonatomic, assign) NSInteger indexCell;
@property(nonatomic,retain) UILabel *urlLabel;
@property (nonatomic, weak) id<TableViewCellDelegate>delegate;
@end


